# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    users = User.all
    # 月間フォロワー数ランキング
    @month_user_relationship_ranks = User.find(Relationship.group(:followed_id).where(created_at: Time.current.all_month).order('count(followed_id) desc').limit(10).pluck(:followed_id))
  end
end
