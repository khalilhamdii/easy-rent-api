class ApplicationController < ActionController::
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  include ExceptionHandler
end
