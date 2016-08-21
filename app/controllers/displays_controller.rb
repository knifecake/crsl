class DisplaysController < ApplicationController
  layout 'public-carousel'

  # public display controller
  # GET /c/:id
  def carousel
    @carousel = Carousel.find(params[:id])

    respond_to do |f|
      f.html {}
      f.json { render 'carousels/show' }
    end
  end
end
