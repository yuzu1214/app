class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :oimo
  belongs_to :potato

end
