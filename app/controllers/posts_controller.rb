class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(post_params)
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to("/posts/index")
  end

  def edit
   @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to "/posts/index"
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
        params.permit(:content)
    end

end
