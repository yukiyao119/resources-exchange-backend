class ReviewsController < ApplicationController

    def index
        reviews = Review.all
        render json: reviews, include: "**", status: 200
    end

    def show 
        review = Review.find(params[:id])
        render json: review, include: "**", status: 200
    end

    def create
        review = Review.create(review_params)
        render json: review, include: "**", status: :created 
    end

    def update
        review = Review.find(params[:id])
        review.update(review_params)
        render json: review, include: "**", status: 200
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
        render json: review
    end 

    private

    def review_params
        params.permit(:user_id, :exchange_id, :content, :author)
    end

end
