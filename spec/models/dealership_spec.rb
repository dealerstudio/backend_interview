require "rails_helper"

RSpec.describe Dealership, type: :model do
  describe "associations" do
    it { should have_many(:cars) }
    it { should have_many(:users) }
  end

  describe "validations" do
    subject { create(:dealership) }

    it { should validate_uniqueness_of(:slug) }
  end

  describe ".active scope" do
    it "returns only active dealerships" do
      active   = create(:dealership, active: true)
      inactive = create(:dealership, active: false)

      expect(Dealership.active).to include(active)
      expect(Dealership.active).not_to include(inactive)
    end
  end
end
