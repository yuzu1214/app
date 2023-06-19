class Tag < ApplicationRecord
    has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
    has_many :oimos, through: :tag_maps
    has_many :potatos, through: :tag_maps  
end
