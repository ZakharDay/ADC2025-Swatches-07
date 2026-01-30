class Api::V1::SwatchesController < ApplicationController
  include JwtAuth

  skip_before_action :verify_authenticity_token
  before_action :load_user_by_jti, only: :create

  def index
    # @swatches = current_user.swatches.where(project_id: nil)
    @swatches = Swatch.all.limit(8)
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

        render json: {
          messages: "Swatch create",
          is_success: true,
          swatch_id: swatch.id
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
