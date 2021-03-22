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
    @post.save
    redirect_to request.referer
  end

  def edit
   @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to request.referer
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private

    def post_params
        params.permit(:id, :title, :content, :picture).merge(user_id: current_user.id)
    end

end
