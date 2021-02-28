class FavoriteQsController < ApplicationController
  def create
    user=current_user
    post=PostQ.find(params[:post_q_id])
    if FavoriteQ.create(user_id: user.id,post_q_id:post.id)
    redirect_to post
    else
      redirect_to root_url
    end

  end

  def destroy
    user=current_user
    post=PostQ.find(params[:post_q_id])
    if favorite_q=FavoriteQ.find_by(user_id: user.id,post_q_id:post.id)
      favorite_q.delete
      redirect_to users_path(current_user)
    else
      redirect_to root_url
    end

  end

end
