# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  has_many :comments, dependent: :destroy
  has_many :replies, through: :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  has_one_attached :eyecatch
  attr_accessor :image

  validates :title,
            presence: { message: 'を入力してください' },
            length: { maximum: 20, message: 'は20文字以内で入力してください' }
  validates :content,
            presence: { message: 'を入力してください' },
            length: { maximum: 500, message: 'は500文字以内で入力してください' }
  validates :tag,
            presence: { message: 'を入力してください' }

  def user
    User.find_by(id: user_id)
  end

  def create_notification_message!(current_user, _comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Message.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_message!(current_user, message_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_message!(current_user, message_id, user_id) if temp_ids.blank?
  end

  def eyecatch=(image)
    if image.present?
      prefix = image[%r{(image|application)(/.*)(?=;)}]
      type = prefix.sub(%r{(image|application)(/)}, '')
      data = Base64.decode64(image.sub(/data:#{prefix};base64,/, ''))
      filename = "#{Time.zone.now.strftime('%Y%m%d%H%M%S%L')}.#{type}"
      File.open("#{Rails.root}/tmp/#{filename}", 'wb') do |f|
        f.write(data)
      end
      eyecatch.detach if eyecatch.attached?
      eyecatch.attach(io: File.open("#{Rails.root}/tmp/#{filename}"), filename: filename)
      FileUtils.rm("#{Rails.root}/tmp/#{filename}")
    end
  end

  def image_url
    Rails.application.routes.url_helpers.rails_blob_path(eyecatch, only_path: true) if eyecatch.attached?
  end
end
