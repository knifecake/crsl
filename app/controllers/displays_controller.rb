class DisplaysController < ApplicationController
  layout 'carousel'

  def carousel
    @carousel = Carousel.find(params[:id])

    respond_to do |f|
      f.html {}
      f.json { render 'carousels/show' }
    end
  end
end
