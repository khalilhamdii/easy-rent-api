class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]

  # GET /api/v1/cars
  def index
    @cars = Car.all
    if @cars
      json_response(@cars)
    else
      render json: {
        status: 500,
        errors: ['no cars found']
      }
    end
  end

  # POST /api/v1/cars
  def create
    @car = Car.new(car_params)
    if @car.save
      json_response(@car, :created)
    else
      render json: {
        status: 422,
        errors: @car.errors.full_messages
      }
    end
  end

  # GET /api/v1/cars/:id
  def show
    json_response(@car)
  end

  # PUT /api/v1/cars/:id
  def update
    @car.update(car_params)
    json_response(@car, :accepted)
  end

  # DELETE /api/v1/cars/:id
  def destroy
    @car.destroy
    render json: {
      status: 'deleted'
    }
  end

  private

  def car_params
    # whitelist params
    params.permit(:model, :color, :bodyStyle, :pricePerDay, :doors, :luggages, :seats, :emissionsClass,
                  :transmission, :engine, :rentDeposit, :carImg)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
