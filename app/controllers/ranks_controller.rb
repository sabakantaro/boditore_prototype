class RanksController < ApplicationController
  def index
    # 月間ランキング
    # @month_user_post_ranks = User.where(id: Post.group(:user_id).where(created_at: Time.current.all_month).order('count(user_id) desc').pluck(:user_id))
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end
end
