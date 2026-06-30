require "rails_helper"

RSpec.describe Car, type: :model do
  describe "associations" do
    it { should belong_to(:dealership) }
  end

  describe "validations" do
    # create (not build) so validate_uniqueness_of can persist a record to test against
    subject { create(:car) }

    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:model) }
    it { should validate_uniqueness_of(:vin) }
  end

  describe "status" do
    it "defaults to available when not set" do
      car = Car.new
      expect(car.status).to eq("available")
    end
  end
end
