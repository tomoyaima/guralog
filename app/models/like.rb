
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :log
  
  validates_uniqueness_of :log_id, scope: :user_id
end
