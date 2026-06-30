class DealershipsController < ApplicationController
  def index
    @dealerships = Dealership.active
  end

  def show
    @dealership = Dealership.find(params[:id])
    @cars = @dealership.cars
  end
end
