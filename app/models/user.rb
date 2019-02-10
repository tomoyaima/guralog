class User < ApplicationRecord
  #Timeline Start
  #アソシエーション(1:多)
  has_many :logs
  #Timeline End

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

   has_many :logs, dependent: :destroy
   has_many :likes, dependent: :destroy
   has_many :liked_logs, through: :likes, source: :log
   def already_liked?(log)
    self.likes.exists?(log_id: log.id)
  end
end
