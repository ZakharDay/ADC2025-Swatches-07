class Api::V1::FillsController < ApplicationController
  include JwtAuth

  before_action :load_user_by_jti, only: [:my]

  def my
    @fills = @user.fills
  end

end
