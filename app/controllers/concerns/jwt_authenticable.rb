module JwtAuthenticatable
  extend ActiveSupport::Concern

  included do
    # before_action :require_login
    helper_method :encrypt_payload, :decrypt_payload
  end

  def encrypt_payload(payload)
    # payload = @user.as_json(only: [:jti])
    jwt_signing_key = Rails.application.credentials.jwt_signing_key!
    token = JWT.encode(payload, jwt_signing_key, 'HS256')
  end

  def decrypt_payload
    bearer = request.headers["Authorization"]
    jwt = bearer.split(' ').last
    jwt_signing_key = Rails.application.credentials.jwt_signing_key!
    token = JWT.decode(jwt, jwt_signing_key, true, { algorithm: 'HS256' })
  end

  # private

  # def require_login
  #   unless logged_in?
  #     flash[:alert] = "You must be logged in to access this section"
  #     redirect_to login_path
  #   end
  # end
end