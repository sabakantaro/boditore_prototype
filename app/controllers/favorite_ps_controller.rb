class FavoritePsController < ApplicationController

  def create
    @user=current_user
    @post_p=PostP.find(params[:post_p_id])
    if FavoriteP.create(user_id: user.id,post_p_id:post_p.id)
    redirect_to post_p
    else
      redirect_to root_url
    end

  end

  def destroy
    @user=current_user
    @post_p=PostP.find(params[:post_p_id])
    if favorite_p=FavoriteP.find_by(user_id: user.id,post_p_id:post_p.id)
      favorite_p.delete
      redirect_to users_path(current_user)
    else
      redirect_to root_url
    end
  end
end
