class ReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update,:destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = t('.success_post')
      redirect_to @review
    else
      flash.now[:danger] = t('.danger_post')
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:success] = t('.success_update')
      redirect_to @review
    else
      flash.now[:danger] = t('.danger_update')
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:success] = t('.success_destroy')
    redirect_to user_url(id: current_user.id)
  end
  
  
  
  private
  
  def review_params
    params.require(:review).permit(:theater, :seat, :program, :content, :prefecture_id)
  end
  
  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end
end
