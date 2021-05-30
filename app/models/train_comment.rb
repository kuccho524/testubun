class TrainComment < ApplicationRecord

  # アソシエーション
  belongs_to :user
  belongs_to :train

  # バリデーション
  validates :comment, presence: true

end
