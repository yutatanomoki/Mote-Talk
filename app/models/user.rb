class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many_attached :profile_images
  has_one :instructor
  has_many :reservations, dependent: :destroy
  has_many :request_boards, dependent: :destroy
  has_many :board_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :user_rooms
  has_many :entries
  has_many :messages
end
