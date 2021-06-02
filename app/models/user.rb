class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :trains, dependent: :destroy
  has_many :train_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # バリデーション
  validates :name, presence: true
  validates :introduction, length: { maximum: 50 }
  attachment :profile_image, destroy: false
end
