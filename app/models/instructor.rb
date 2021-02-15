class Instructor < ApplicationRecord
  belongs_to :user
  has_many :board_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
