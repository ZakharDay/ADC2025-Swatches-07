class SwatchesController < ApplicationController
  load_and_authorize_resource
  before_action :set_swatch, only: %i[ fork show edit update destroy ]

  def index
    @swatches = Swatch.all
  end

  def my
    @swatches = current_user.swatches
    render :index
    # current_user.swatches.where(project_id: nil)
  end

  def show
  end

  def fork
    swatch_fork = @swatch.dup
    swatch_fork.origin_id = @swatch.id
    swatch_fork.user_id = current_user.id
    swatch_fork.project_id = nil

    if swatch_fork.save
      fills = @swatch.fills

      fills.each do |fill|
        fill_fork = fill.dup
        fill_fork.origin_id = fill.id
        fill_fork.user_id = current_user.id
        fill_fork.swatch_id = swatch_fork.id
        fill_fork.save
      end

      redirect_to swatch_fork
    end
  end

  def new
    @swatch = Swatch.new
  end

  def edit
  end

  def create
    @swatch = Swatch.new(swatch_params)
    @swatch.user = current_user

    if params[:project_id]
      @swatch.project_id = params[:project_id]
    end

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
