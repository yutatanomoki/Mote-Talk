class Instructor < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :board_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :favorites

  def avg_score
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f
    end
  end

  def review_score_percentage
    if reviews.empty?
      0.0
    else
      reviews.average(:score).round(1).to_f * 100 / 5
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
