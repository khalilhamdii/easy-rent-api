class ApplicationController < ActionController::Base
  include ExceptionHandler

  skip_before_action :verify_authenticity_token

  helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!, :set_user

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def login!
    session[:user_id] = @user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user?
    @user == current_user
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
  end
end
