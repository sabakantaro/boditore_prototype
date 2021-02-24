class PostQsController < ApplicationController

  def index
    @post_qs = PostQ.all.order(created_at: :desc)
  end

  def new
  end

  def create
    @post_q = PostQ.new(content: params[:content])
    @post_q.save
    redirect_to("/post_qs/index")
  end

  def edit
    @post_q = PostQ.find(params[:id])
  end

  def update
    @post_q = PostQ.find(params[:id])
    if @post_q.update(post_q_params)
      redirect_to("/post_qs/index")
    else
      render :new
    end
  end

  def destroy
    @post_q = PostQ.find(params[:id])
    @post_q.destroy
    redirect_to request.referer
  end

  private

    def post_p_params
        params.require(:post_q).permit(:content)
    end
end
