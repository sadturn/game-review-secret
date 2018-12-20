class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:notice] = "Review successfully created"
      redirect_to root_path
    else
      flash[:error] = "Review has error"
      render 'new'
    end  
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated"
      redirect_to review_path(@review.id)
    else
      flash[:error] = "Review has error"
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :title, :body)
  end
  
  def find_review
    @review = Review.find_by(id: params[:id])
  end
end
