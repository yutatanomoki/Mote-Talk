class Review < ApplicationRecord
  belongs_to :user
  belongs_to :instructor

  validates :score, presence: true
end
