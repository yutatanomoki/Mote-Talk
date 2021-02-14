class Reservation < ApplicationRecord
  # いいねする側のUserを「to_favorite」と定義
  belongs_to :to_reservation, class_name: "User"
  # いいねされる側のUserを「from_favorite」と定義
  belongs_to :from_reservation, class_name: "User"
  
  validates :to_reservation_id, presence: true
  validates :from_reservation_id, presence: true
  
end
