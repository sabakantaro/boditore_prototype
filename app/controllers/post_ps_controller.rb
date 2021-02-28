class PostPsController < ApplicationController

  def index
    @post_ps = PostP.all.order(created_at: :desc)
  end

  def new
  end

  def create
    @post_p = PostP.new(content: params[:content])
    # @post_p = @post_p.post
    if @post_p.save
      # ここから
      @post_p.create_notification_post_p!(current_user, @comment.id)
      # ここまで
      respond_to :js
    else
    redirect_to("/post_ps/index")
    end
  end

  def edit
   @post_p = PostP.find(params[:id])
  end

  def update
    @post_p = PostP.find(params[:id])
    if @post_p.update(post_p_params)
      redirect_to("/post_ps/index")
    else
      render :new
    end
  end

  def destroy
    @post_p = PostP.find(params[:id])
    @post_p.destroy
    redirect_to request.referer
  end

  private

    def post_p_params
        params.require(:post_p).permit(:content, :tag_list)
    end

end
