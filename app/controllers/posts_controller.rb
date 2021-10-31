class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def search
    if params[:title].present?
      @posts = Post.where('title LIKE ?', "%#{params[:title]}%")
    else
      @posts = Post.none
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id:params[:id])
    @favorites_count = Favorite.where(post_id: params[:id]).count
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    if @post.save
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
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :picture).merge(user_id: current_user.id)
    end

end
