class Favorite < ApplicationRecord
  # いいねする側のUserを「to_favorite」と定義
  belongs_to :to_favorite, class_name: "User", optional: true
  # いいねされる側のUserを「from_favorite」と定義
  belongs_to :from_favorite, class_name: "User", optional: true
end
