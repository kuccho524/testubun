class Train < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_many :train_comments, dependent: :destroy

  # バリデーション
  attachment :train_image, destroy: false
  validates :body, length: { minimum: 3, maximum: 29 }

  #enum
  enum company: {
    JR: 0,
    阪急: 1,
    京阪: 2,
    近鉄: 3,
    南海: 4,
    阪神: 5,
    山陽: 6,
    神鉄: 7,
    東武: 8,
    西武: 9,
    京急: 10,
    京成: 11,
    東急: 12,
    小田急: 13,
    京王: 14,
    相鉄: 15,
    名鉄: 16,
    西鉄: 17,
    地下鉄: 18,
    その他: 19
  }
end
