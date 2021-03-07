class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  default_scope -> { order(created_at: :desc) }
  acts_as_taggable

  def user
    return User.find_by(id: self.user_id)
  end

  def create_notification_message!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Message.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_message!(current_user, message_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_message!(current_user, message_id, user_id) if temp_ids.blank?
  end
end
