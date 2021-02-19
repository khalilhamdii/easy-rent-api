class RentsController < ApplicationController
  before_action :set_user

  # GET /users/:user_id/rents
  def index
    json_response(@user.rents)
  end

  # POST /users/:user_id/rents
  def create
    @user.rents.create!(rent_params)
    json_response(@user, :created)
  end

  private

  def rent_params
    params.permit(:userName, :model, :status, :pickUpDate, :pickUpTime, :returnDate, :returnTime, :location,
                  :pricePerDay)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
