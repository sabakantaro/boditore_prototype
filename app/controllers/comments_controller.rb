class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { redirect_to "/posts/#{@comment.post.id}" }
      else
        format.html { redirect_to post_path(@comment.post), notice: '投稿できませんでした' }
      end
    end
    # @comment = current_user.comments.new(comment_params)
    # if @comment.save
    #   redirect_to "/posts/#{@comment.post.id}", notice: '投稿されました'
    # else
    #   flash.now[:alert] = '入力してください'
    #   redirect_to "/posts/#{@comment.post.id}"
    # end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to "/posts/#{@comment.post.id}", notice: 'コメントを削除しました'
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :parent_id).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
