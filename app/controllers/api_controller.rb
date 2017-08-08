class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  include Api::V1::ExceptionRescue

  before_action :authenticate_token

  private
  def authenticate_token
    raise ApiError::InvalidToken.new unless params[:token] == ENV["ANGKORVOICE_TOKEN"]
  end
end
