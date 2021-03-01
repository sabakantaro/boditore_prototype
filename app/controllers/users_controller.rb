class UsersController < ApplicationController

  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following.all
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.all
    render 'show_follow'
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ようこそBoditoreへ"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end



  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :picture, :search)
    end
end