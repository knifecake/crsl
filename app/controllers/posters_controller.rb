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
        f.html { redirect_to @carousel, notice: t('posters.create.success') }
        f.json { render json: @poster, status: :created }
      else
        f.html { render :new }
        f.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @poster.destroy

    respond_to do |f|
      f.html { redirect_to @poster.carousel, notice: t('posters.destroy.success') }
      f.json { head :no_content }
    end
  end

  def reorder
    order = params[:ordering].split(',')
    order.each_with_index do |poster, index|
      p = Poster.find_by(id: poster, carousel: @carousel)
      p.order = index
      unless p.save
        redirect_to @carousel, alert: t('posters.reorder.error')
      end
    end

    redirect_to @carousel, notice: t('posters.reorder.success')
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
