class Like < ApplicationRecord
  belongs_to :oimo
  belongs_to :potato
  belongs_to :user

  validates_uniqueness_of :oimo_id, scope: :user_id
  validates_uniqueness_of :potato_id, scope: :user_id
end
