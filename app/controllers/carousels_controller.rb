class CarouselsController < AdminController
  before_action :set_carousel, only: [:show, :edit, :update, :destroy]

  # GET /carousels
  # GET /carousels.json
  def index
    @carousels = Carousel.where(user: current_user)
  end

  # GET /carousels/1
  # GET /carousels/1.json
  def show
  end

  # GET /carousels/new
  def new
    @carousel = Carousel.new(user: current_user)
  end

  # GET /carousels/1/edit
  def edit
  end

  # POST /carousels
  # POST /carousels.json
  def create
    @carousel = Carousel.new(carousel_params)

    respond_to do |format|
      if @carousel.save
        format.html { redirect_to @carousel, notice: t('carousels.create.success') }
        format.json { render :show, status: :created, location: @carousel }
      else
        format.html { render :new }
        format.json { render json: @carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carousels/1
  # PATCH/PUT /carousels/1.json
  def update
    respond_to do |format|
      if @carousel.update(carousel_params)
        format.html { redirect_to @carousel, notice: t('carousels.update.success') }
        format.json { render :show, status: :ok, location: @carousel }
      else
        format.html { render :show }
        format.json { render json: @carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carousels/1
  # DELETE /carousels/1.json
  def destroy
    @carousel.destroy
    respond_to do |format|
      format.html { redirect_to carousels_url, notice: t('carousels.destroy.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carousel
      @carousel = Carousel.find_by(id: params[:id])

      raise Exception unless @carousel.user == current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carousel_params
      params.require(:carousel).permit(:title, :display_orientation, :speed, :user_id)
    end
end
