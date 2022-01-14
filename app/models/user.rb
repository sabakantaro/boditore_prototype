# frozen_string_literal: true

class User < ApplicationRecord
  has_many :active_relationships,  class_name: 'Relationship',
                                   foreign_key: 'follower_id',
                                   dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :favorites
  has_many :posts, through: :favorites
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments
  has_one_attached :image
  validates_inclusion_of :experience, in: 0..100, message: 'は0~100年で入力してください'
  validate :image_type, :image_size

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # ゲストユーザー
  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
      user.password_confirmation = user.password
      user.name = 'テスト'
      user.profile = 'テスト'
      user.experience = '5'
    end
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? ', current_user.id, id])
    if temp.blank?
      notification = current_user.active_notifications.new(visited_id: id)
      notification.save if notification.valid?
    end
  end

  def image_url
    Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) if image.attached?
  end
end

private
  def image_type
    if image.attached? 
      if !image.blob.content_type.in?(%('image/jpeg image/png image/jpg'))
        image.purge
        errors.add(:images, 'はjpegまたはpng形式でアップロードしてください')
      end
    end
  end

  def image_size
    if image.attached? 
      if image.blob.byte_size > 5.megabytes
        image.purge
        errors.add(:images, "は1つのファイル5MB以内にしてください")
      end
    end
  end
