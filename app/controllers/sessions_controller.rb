# rubocop:disable Style/SafeNavigation
class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      login!
      render json: {
        logged_in: true,
        user: @user
      }
    else
      render json: {
        status: 401,
        errors: ['User not found, please try again!']
      }
    end
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end

# rubocop:enable Style/SafeNavigation
