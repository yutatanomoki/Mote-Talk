class RequestBoard < ApplicationRecord
  belongs_to :user
  has_many :board_comments, dependent: :destroy
  
  validates :comment, presence: true
end
