class FavoriteQ < ApplicationRecord
  belongs_to :user
  belongs_to :post_q
end
