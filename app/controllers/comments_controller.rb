class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to "/posts/#{@comment.post.id}", notice: '投稿されました'
    else
      flash.now[:alert] = '入力してください'
      redirect_to "/posts/#{@comment.post.id}"
    end
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
