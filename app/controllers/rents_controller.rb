# rubocop:disable Layout/LineLength
class RentsController < ApplicationController
  before_action :set_user
  before_action :set_user_rent, only: %i[update destroy]

  # GET /rents
  def all
    @rents = Rent.all
    if @rents
      json_response(@rents)
    else
      render json: {
        status: 500,
        errors: ['no rents found']
      }
    end
  end

  # GET /users/:user_id/rents
  def index
    if @user.rents
      json_response(@user.rents, :ok)
    else
      render json: {
        status: 500,
        errors: ['no rents found']
      }
    end
  end

  # POST /users/:user_id/rents
  def create
    @user.rents.create!(rent_params)
    json_response(@user, :created)
  end

  # DELETE /users/:user_id/rents/:id
  # DELETE /rents/:id
  def destroy
    @rent.destroy
    render json: {
      status: 'deleted'
    }
  end

  # PUT /rents/:id
  def update
    @rent.update(rent_params)
    render json: {
      status: 'updated'
    }
  end

  private

  def rent_params
    params.require(:rent).permit(:userName, :model, :status, :pickUpDate, :pickUpTime, :returnDate, :returnTime, :location,
                                 :pricePerDay)
  end

  def set_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def set_user_rent
    @rent = @user ? @user.rents.find_by!(id: params[:id]) : Rent.find(params[:id])
  end
end

# rubocop:enable Layout/LineLength
