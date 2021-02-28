class PostQ < ApplicationRecord
  belongs_to :user
  has_many :notifications, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
end
