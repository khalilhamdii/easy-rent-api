class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  def index
    @users = User.all
    if @users
      render json: {
        users: @users
      }
    else
      render json: {
        status: 500,
        errors: ['no users found']
      }
    end
  end

  def show
    if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      render json: {
        status: :created,
        user: @user
      }
    else
      render json: {
        status: 422,
        errors: @user.errors.full_messages
      }
    end
  end

  def update
    if @user.update(user_params)
      render json: {
        status: :updated,
        user: @user
      }
    else render json: {
      status: 500,
      errors: @user.errors.full_messages
    }
    end
  end

  def destroy
    @user.destroy
    render json: {
      status: 204
    }
  end

  private

  def user_params
    params.require(:user).permit(:userName, :email, :password, :password_confirmation, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
