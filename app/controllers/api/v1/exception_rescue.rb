module Api::V1::ExceptionRescue
  extend ActiveSupport::Concern

  included do
    rescue_from ApiError::InvalidToken, with: :render_invalid_token_message
  end

  def render_invalid_token_message
    render json: {
      message: "Invalid token."
    }
  end
end
