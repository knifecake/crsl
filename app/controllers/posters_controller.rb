class PostersController < AdminController
  before_action :set_carousel
  before_action :set_poster, only: :destroy

  def new
    @poster =  @carousel.posters.new
  end

  def create
    @poster = @carousel.posters.new(poster_params)

    respond_to do |f|
      if @poster.save
        f.html { redirect_to @poster.carousel, notice: 'Poster successfully created.' }
        f.json { render json: @poster, status: :created }
      else
        f.html { render :new }
        f.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @poster.delete

    respond_to do |f|
      f.html { redirect_to @poster.carousel, notice: 'Poster successfully deleted.' }
      f.json { head :no_content }
    end
  end

  protected
    def poster_params
      params.require(:poster).permit(:title, :background)
    end

    def set_carousel
      @carousel = Carousel.find(params[:carousel_id])
      raise Exception unless @carousel.user == current_user
    end

    def set_poster
      @poster = @carousel.posters.find(params[:id])
    end
end
