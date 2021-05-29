class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    review = Review.find(params[:review_id])
    current_user.like(review)
    flash[:success] = t('.success_favorite')
    redirect_back(fallback_location: root_path)
  end

  def destroy
    review = Review.find(params[:review_id])
    current_user.unlike(review)
    flash[:danger] = t('.danger_favorite')
    redirect_back(fallback_location: root_path)
  end
end
