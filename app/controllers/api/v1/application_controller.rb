# add API V1 to the ApplicationController
require 'jwt'

class Api::V1::ApplicationController < ActionController::API
  attr_reader :current_user

  protected

  def authenticate_user
    return failed_authentication if auth_header.blank?

    payload = auth_header
    token   = JWT.decode(payload, Rails.application.credentials.jwt_secret)

    begin
      Rails.logger.debug token
      @current_user = User.find(token.first['user_id'])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Invalid token' }, status: :unauthorized
    rescue JWT::DecodeError
      render json: { errors: 'Invalid token' }, status: :unauthorized
    else
      @current_user
    end
  end

  def failed_authentication
    raise Account::Error, 'Account :: Problema de autenticación'
  rescue Account::Error => e
    render json: { errors: e.message }, status: :unauthorized
  end

  def auth_header
    request.headers['Authorization']
  end
end
