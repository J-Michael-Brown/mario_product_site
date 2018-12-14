require 'pry'

class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to  product_reviews_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review= Review.find(params[:id])
    if @review.update(review_params)
      redirect_to product_reviews_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_reviews_path
  end

private
  def review_params
    params.require(:review).permit(:username, :content_body, :rating) # permit takes a *splat
  end
end