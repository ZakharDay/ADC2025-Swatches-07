class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.new(user_params)

    if @user.save
      render json: {
        messages: "Signed Up Successfully",
        is_success: true,
        jwt: encrypt_payload
      }, status: :ok
    else
      render json: {
        messages: "Sign Up Failed",
        is_success: false
      }, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.expect(user: [ :email, :password, :password_confirmation ])
    end

    def encrypt_payload
      payload = @user.as_json(only: [:jti])
      jwt_signing_key = Rails.application.credentials.jwt_signing_key!
      token = JWT.encode(payload, jwt_signing_key, 'HS256')
    end

end