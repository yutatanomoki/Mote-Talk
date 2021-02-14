class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :request_boards, dependent: :destroy
  has_many :board_comments, dependent: :destroy

  
  
  has_many :favorites, class_name: "Favorite", foreign_key: :to_favorite_id
  has_many :from_favorites, through: :favorites, source: :from_favorite

  has_many :reverse_of_favorites, class_name: "Favorite", foreign_key: :from_favorite_id
  has_many :to_favorites, through: :reverse_of_favorites, source: :to_favorite
  
  has_many :reservations, class_name: "Reservation", foreign_key: :to_favorite_id
  has_many :from_favorites, through: :reservations, source: :from_favorite

  has_many :reverse_of_favorites, class_name: "Reservation", foreign_key: :from_favorite_id
  has_many :to_favorites, through: :reverse_of_reservations, source: :to_favorite
 
  has_many :favorites, class_name: "Favorite", foreign_key: :to_favorite_id
  has_many :from_favorites, through: :favorites, source: :from_favorite

  has_many :reverse_of_favorites, class_name: "Favorite", foreign_key: :from_favorite_id
  has_many :to_favorites, through: :reverse_of_favorites, source: :to_favorite
  
  def favorite(user_id)
    favorites.create(from_favorite_id: user_id)
  end

  def unfavorite(user_id)
    favorites.find_by(from_favorite_id: user_id).destroy
  end

  def favorited_by?(user)
    favorites.where(from_id: user.id).exists?
  end

end
