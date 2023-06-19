class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :oimos, dependent: :destroy
         has_many :potatos, dependent: :destroy

         has_many :likes, dependent: :destroy
         has_many :liked_oimos, through: :likes, source: :oimo
         has_many :liked_potatos, through: :likes, source: :potato

         has_many :oimos, dependent: :destroy 
         has_many :potatos, dependent: :destroy
         validates :name, presence: true 
         validates :profile, length: { maximum: 200 } 

         def already_liked?(oimo)
          self.likes.exists?(oimo_id: oimo.id)
        end

        def already_liked?(potato)
          self.likes.exists?(potato_id: potato.id)
        end

         has_many :comments, dependent: :destroy
         
end
