class TagMap < ApplicationRecord
  belongs_to :oimo
  belongs_to :potato
  belongs_to :tag

  validates :oimo_id, presence: true
  validates :potato_id, presence: true
  validates :tag_id, presence: true
end
