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
      p token
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
    begin
      raise Cart::Error.new('CartError :: Problema de autenticación')
    rescue Cart::Error => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
  
  def auth_header
    request.headers['Authorization']
  end

  def current_user
    @current_user
  end

end
