class FillsController < ApplicationController
  load_and_authorize_resource
  
  layout "application", only: %i[ show new edit create update destroy]
  before_action :set_fill, only: %i[ show edit update destroy ]

  # GET /fills or /fills.json
  def index
    @fills = current_user.fills
  end

  def solid
    fills = current_user.fills
    @fills = []

    fills.each do |fill|
      if fill.colors.count == 1
        @fills << fill
      end
    end
  end

  def gradient
    fills = current_user.fills
    @fills = []

    fills.each do |fill|
      if fill.colors.count > 1
        @fills << fill
      end
    end
  end

  # GET /fills/1 or /fills/1.json
  def show
  end

  # GET /fills/new
  def new
    @fill = Fill.new
  end

  # GET /fills/1/edit
  def edit
  end

  # POST /fills or /fills.json
  def create
    @fill = Fill.new(fill_params)
    @fill.user = current_user

    respond_to do |format|
      if @fill.save
        format.html { redirect_to @fill, notice: "Fill was successfully created." }
        format.json { render :show, status: :created, location: @fill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fills/1 or /fills/1.json
  def update
    respond_to do |format|
      if @fill.update(fill_params)
        format.html { redirect_to @fill, notice: "Fill was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @fill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fills/1 or /fills/1.json
  def destroy
    @fill.destroy!

    respond_to do |format|
      format.html { redirect_to fills_path, notice: "Fill was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fill
      @fill = Fill.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fill_params
      params.expect(fill: [ :name, :swatch_id ])
    end
end
