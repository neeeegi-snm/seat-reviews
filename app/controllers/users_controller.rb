class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.order(id: :desc).page(params[:page]).per(3)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = t('.success_signup')
      redirect_to login_url
    else
      flash.now[:danger] = t('.danger_signup')
      render :new
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @favorite_reviews = @user.preferings.order(id: :desc).page(params[:page]).per(3)
    counts(@user)
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end