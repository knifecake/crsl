class DisplaysController < ApplicationController
  layout 'carousel'

  def carousel
    @carousel = Carousel.find(params[:id])
  end
end
