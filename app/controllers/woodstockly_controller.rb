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
      @message = "Review successfully saved"
    else
      @message = review.errors.full_messages
    end
  end

private

  def review_params
    params.permit(:name, :title, :description, :stars)
  end

end
