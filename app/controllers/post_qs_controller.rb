class PostQsController < ApplicationController

  def index
    @post_qs = PostQ.all
    @post_q = PostQ.new
  end

  def new
  end

  def create
    PostQ.create(post_q_params)
      flash[:success] = "筋肉最高!"
      redirect_to root_url #本来は投稿詳細へ
  end

  def destroy
  end

  private

    def post_q_params
      params.permit(:content)
    end
end
