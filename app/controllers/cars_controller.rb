class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  def index
    # TODO: scope to current_user.dealership
    @cars = Car.all # BUG: missing .includes(:dealership) — causes N+1 in view
  end

  def show; end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.dealership = current_user.dealership

    if @car.save
      redirect_to @car, notice: "Car was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: "Car was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, notice: "Car was successfully destroyed."
  end

  private

  def set_car
    # TODO: add authorization check — should be current_user.dealership.cars.find(params[:id])
    @car = Car.find(params[:id]) # BUG: no ownership check; any user can edit/delete any car
  end

  def car_params
    # TODO: implement status transition logic (available → sold only)
    # TODO: remove :status from permitted params once transition logic exists
    params.require(:car).permit(:make, :model, :year, :price, :vin, :status)
  end
end
