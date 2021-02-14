class Favorite < ApplicationRecord
  # いいねする側のUserを「to_favorite」と定義
  belongs_to :to_favorite, class_name: "User"
  # いいねされる側のUserを「from_favorite」と定義
  belongs_to :from_favorite, class_name: "User"
  
  validates :to_favorite_id, presence: true
  validates :from_favorite_id, presence: true
end
