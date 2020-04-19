# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveModel::UnknownAttributeError do |exception|
    render json: { error: exception }, status: 501
  end
end
