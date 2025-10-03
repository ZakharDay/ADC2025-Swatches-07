class SwatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_swatch, only: %i[ show edit update destroy ]

  # GET /swatches or /swatches.json
  def index
    @swatches = current_user.swatches.where(project_id: nil)
  end

  # GET /swatches/1 or /swatches/1.json
  def show
  end

  # GET /swatches/new
  def new
    @swatch = Swatch.new
  end

  # GET /swatches/1/edit
  def edit
  end

  # POST /swatches or /swatches.json
  def create
    @swatch = Swatch.new(swatch_params)

    respond_to do |format|
      if @swatch.save
        format.html { redirect_to @swatch, notice: "Swatch was successfully created." }
        format.json { render :show, status: :created, location: @swatch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @swatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swatches/1 or /swatches/1.json
  def update
    respond_to do |format|
      if @swatch.update(swatch_params)
        format.html { redirect_to @swatch, notice: "Swatch was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @swatch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @swatch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swatches/1 or /swatches/1.json
  def destroy
    @swatch.destroy!

    respond_to do |format|
      format.html { redirect_to swatches_path, notice: "Swatch was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swatch
      @swatch = Swatch.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def swatch_params
      params.expect(swatch: [ :name, :project_id ])
    end
end
