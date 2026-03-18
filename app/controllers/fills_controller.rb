class FillsController < ApplicationController
  load_and_authorize_resource
  
  layout "application", only: %i[ show new edit create update destroy]
  before_action :set_fill, only: %i[ show edit update destroy ]

  # GET /fills or /fills.json
  def index
    @fills = current_user.fills
  end

  def my
    @fills = current_user.fills
    render :index
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

  def add_fill_color
    render partial: "fills/form_fill_color", locals: { fill_color: FillColor.new }
  end

  # POST /fills or /fills.json
  def create
    @fill = Fill.new(fill_params)
    @fill.user = current_user

    respond_to do |format|
      if @fill.save
        add_colors_to_fills(@fill)

        Turbo::StreamsChannel.broadcast_append_to(
          "promo_fill_rail",
          target: "W_PromoFillRail",
          partial: "components/A_PromoFill",
          locals: { fill: @fill }
        )

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
      params.expect(fill: [ :name ])
    end

    # 
    # Из seeds
    # Потом удалить или отрефакторить
    # 

    def add_colors_to_fills(fill)
      type = ['solid', 'gradient'].sample

      if type == 'solid'
        create_fill_color(fill)
      elsif type == 'gradient'
        create_gradient_color(fill)
      end
    end

    def create_fill_color(fill)
      color = Color.all.sample
      fill.colors << color
    end

    def create_gradient_color(fill)
      quantity = (2..5).to_a.sample
      first_stop = (0..40).to_a.sample
      last_stop = (60..100).to_a.sample

      if quantity > 2
        range = last_stop - first_stop
        step = range / (quantity - 1)
      end

      if (0..9).to_a.sample == 0
        alpha = (0..99).to_a.sample
      else
        alpha = nil
      end

      i = 1

      quantity.times do
        stop = 0

        if i == 1
          stop = first_stop
        elsif i == quantity
          stop = last_stop
        else
          stop = first_stop + (step * (i - 1))
        end

        color = Color.all.sample
        FillColor.create!(fill_id: fill.id, color_id: color.id, stop: stop, alpha: alpha)

        i += 1
      end
    end

end
