# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      # redirect_to "/posts/#{@comment.post.id}", notice: '投稿されました'
      respond_to do |format|
        format.html { redirect_to "/posts/#{@comment.post.id}" }
        format.json do
          render json: { text: @comment.text, parent_id: @comment.parent_id, user_name: @comment.user.name,
                         user_id: @comment.user_id, id: @comment.id }
        end
      end
    else
      flash.now[:alert] = '入力してください'
      # redirect_to "/posts/#{@comment.post.id}"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    # redirect_to "/posts/#{@comment.post.id}", notice: 'コメントを削除しました'
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to "/posts/#{@comment.post.id}" }
        format.json { render json: { id: params[:id] } }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :parent_id).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
