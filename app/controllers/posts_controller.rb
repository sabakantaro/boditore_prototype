# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def search
    @posts = if params[:title].present?
               Post.where('title LIKE ?', "%#{params[:title]}%")
             else
               Post.none
             end
    @posts = @posts.page(params[:page])
  end

  def index
    @posts = Post.all.order(created_at: :desc)
    # 月間お気に入り数ランキング
    @month_post_favorite_ranks = Post.find(Favorite.group(:post_id).where(created_at: Time.current.all_month).order('count(post_id) desc').limit(10).pluck(:post_id))
  end

  def show
    @post = Post.find_by(id: params[:id])
    @favorites_count = Favorite.where(post_id: params[:id]).count
    @comments = @post.comments
    @comment = current_user.comments.new
    @comment_reply = @post.comments.build
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    if @post.save
      @post.eyecatch = post_params[:image]
      redirect_to @post, notice: '投稿されました'
    else
      flash.now[:alert] = '入力してください'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :tag).merge(user_id: current_user.id)
  end
end
