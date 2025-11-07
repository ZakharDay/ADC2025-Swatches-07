class Api::V1::SwatchesController < ApplicationController

  def index
    # @swatches = current_user.swatches.where(project_id: nil)
    @swatches = Swatch.all.limit(8)
  end

  def show
    @swatch = Swatch.find(params.expect(:id))
  end

end
