class HomeController < ApplicationController
  layout 'public'
  def index
  end

  def carousel
    @carousel = Carousel.find(params[:id])
  end
end
