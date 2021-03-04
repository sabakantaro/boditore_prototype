class Post < ApplicationRecord
  # belongs_to :user
  has_many :notifications
  has_many :favorite_ps
  has_many :users, through: :favorite_ps
  default_scope -> { order(created_at: :desc) }
  acts_as_taggable

  def create_notification_post!(current_user, post_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Post.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_post!(current_user, post_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_post!(current_user, post_id, user_id) if temp_ids.blank?
  end

  def save_notification_post!(current_user, post_p_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      visited_id: visited_id,
      action: 'post_p'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
