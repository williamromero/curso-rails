require 'jwt'

class Api::V1::AuthenticationsController < Api::V1::ApplicationController

  def login
    user = User.find_by_email(auth_params[:email])
    
    if user && user.authenticate(auth_params[:password])
      token = JWT.encode({ username: user.username, user_id: user.id }, Rails.application.credentials.jwt_secret, 'HS256')
      render json: { message: "Login successful", token: token }, status: :ok
    else
      render json: { message: "Login failed" }, status: :unauthorized
    end

  end

  def register
    begin
      User.create!(auth_params)
      render json: { message: "Register successful" }
    rescue ActiveRecord::RecordInvalid => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end


  def forgot
    return render json: { message: 'Email not present' } if auth_params[:email].blank?
    
    user = User.find_by(email: auth_params[:email].downcase)
    if user.present?
      user.generate_password_token
      render json: {
        result: 0,
        message: "Email was sended",
        token: user.token
      }
    else
      render json: {
        result: 1,
        message: 'Email address not found. Please check and try again.',
        status: :not_found
      }
    end    
  end  

  private

  def auth_params
    params.require(:authentication).permit(:username, :email, :password)
  end

end
