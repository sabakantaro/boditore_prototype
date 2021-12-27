# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update]

  def search
    @users = if params[:experience].present?
               User.where('experience LIKE ?', "%#{params[:experience]}%")
             else
               User.none
             end
    @users = @users.page(params[:page])

  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following.all.page(params[:page])
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers.all.page(params[:page])
    render 'show_follow'
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])

    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id) # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorite_list = Post.find(favorites) # postsテーブルから、お気に入り登録済みのレコードを取得

    @post = current_user.posts.build
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def new; end

  def create
    @user = User.new(user_params)
    @user.create_notification_follow!(current_user)
    if @user.save
      log_in @user
      redirect_to @user, notice: 'ようこそBoditoreへ'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:name, :email, :password, :image,
                  :password_confirmation, :profile, :experience, :search)
  end

  # beforeアクション
  def logged_in_user
    unless logged_in?
      flash[:danger] = 'ログインしてください'
      redirect_to login_url
    end
  end
end
