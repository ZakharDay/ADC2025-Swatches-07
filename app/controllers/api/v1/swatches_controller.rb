class Api::V1::SwatchesController < ApplicationController
  include JwtAuth

  skip_before_action :verify_authenticity_token
  before_action :load_user_by_jti, only: [:index, :create]

  def index
    @swatches = @user.swatches
  end

  def show
    @swatch = Swatch.find(params.expect(:id))
  end

  def create
    if @user
      swatch = Swatch.new()
      swatch.name = params[:swatch][:name]
      swatch.user = @user
      
      if swatch.save!
        fills = Fill.find(params[:swatch][:fill_ids])

        fills.each do |fill|
          swatch.fills << fill
        end

        Turbo::StreamsChannel.broadcast_append_to(
          "promo_swatch_rail",
          target: "W_PromoSwatchRail",
          partial: "components/O_PromoSwatch",
          locals: { swatch: swatch }
        )

        render json: {
          messages: "Swatch create",
          is_success: true,
          id: swatch.id
        }, status: :ok
      end
    else
      render json: {
        messages: "Unauthorized",
        is_success: false,
      }, status: :unauthorized
    end
  end

end
