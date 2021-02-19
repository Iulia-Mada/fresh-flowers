class ApplicationController < ActionController::API
  include Swagger::Blocks

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActionController::ParameterMissing, with: :render_params_missing_response

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_params_missing_response(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end
end
