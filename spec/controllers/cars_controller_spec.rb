require "rails_helper"

RSpec.describe CarsController, type: :controller do
  render_views

  let(:dealership_a) { create(:dealership) }
  let(:dealership_b) { create(:dealership) }
  let(:user_a)  { create(:user, dealership: dealership_a) }
  let(:car_b)   { create(:car, dealership: dealership_b) }

  before { sign_in user_a }

  describe "GET #index" do
    it "does not trigger N+1 queries when displaying cars" do
      create_list(:car, 3, dealership: dealership_a)

      queries = []
      subscription = ActiveSupport::Notifications.subscribe("sql.active_record") do |*, payload|
        queries << payload[:sql] unless payload[:sql].match?(/\A(PRAGMA|SAVEPOINT|RELEASE|BEGIN|COMMIT)/i)
      end

      get :index

      ActiveSupport::Notifications.unsubscribe(subscription)

      dealership_queries = queries.select { |q| q.include?("dealerships") }
      expect(dealership_queries.count).to be <= 2,
        "Expected at most 2 dealership queries (1 preload + 1 for current user), got #{dealership_queries.count}"
    end
  end

  describe "PATCH #update" do
    it "prevents a user from updating a car belonging to another dealership" do
      patch :update, params: { id: car_b.id, car: { make: "Hacked" } }

      expect(car_b.reload.make).not_to eq("Hacked")
    end
  end

  describe "DELETE #destroy" do
    it "prevents a user from deleting a car belonging to another dealership" do
      delete :destroy, params: { id: car_b.id }

      expect { car_b.reload }.not_to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
