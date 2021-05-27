class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trains, dependent: :destroy
  attachment :profile_image, destroy: false
  validates :name, presence: true
  validates :introduction, length: { maximum: 10 }
end
