class FavoriteP < ApplicationRecord
  belongs_to :user
  belongs_to :post_p
end
