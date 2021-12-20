class RanksController < ApplicationController
  def index
    #月間お気に入り数ランキング
    @month_user_favorite_ranks = Post.find(Favorite.group(:post_id).where(created_at: Time.current.all_month).order('count(post_id) desc').limit(3).pluck(:post_id))
    #月間投稿数ランキング
    @month_user_post_ranks = User.find(Post.group(:user_id).where(created_at: Time.current.all_month).order('count(user_id) desc').limit(3).pluck(:user_id))
    #月間フォロワー数ランキング
    @month_user_relationship_ranks = User.find(Relationship.group(:followed_id).where(created_at: Time.current.all_month).order('count(followed_id) desc').limit(3).pluck(:followed_id))
  end
end
