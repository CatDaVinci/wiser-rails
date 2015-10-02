class Api::V1::ApplicationController < ApplicationController
  def render_error(code, error_type, error_message)
    json = {
      error: error_type,
      message: error_message
    }
    render json: json, status: code
  end
end
