class WoodstocklyController < ApplicationController
  def index
    @reviews = Review.all
    array_of_ratings = []
    @reviews.each do |review|
      array_of_ratings << review.stars
    end
    @average_rating = array_of_ratings.sum / array_of_ratings.size.to_f.round(2)
  end

  def new
    # leaving this empty on purpose
  end

  def create 
    review = Review.new(review_params)

    if review.save
      #@message = "Review successfully saved"
      flash[:notice] = 'YAY!' #flashes a notice at the top of the page
      redirect_to '/'
    else
      #@message = review.errors.full_messages
      flash[:notice] = review.errors.full_messages.to_sentence
      render :new
      #render preserves data, redirect_to does not
    end
  end

private

  def review_params
    params.permit(:name, :title, :description, :stars)
  end

end
