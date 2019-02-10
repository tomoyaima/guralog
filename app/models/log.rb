class Log < ApplicationRecord
  #Timeline Start
  #アソシエーション(1:多)
  belongs_to :user
  #Timeline End

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
end
