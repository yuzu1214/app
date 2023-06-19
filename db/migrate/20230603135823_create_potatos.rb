class CreatePotatos < ActiveRecord::Migration[6.1]
  def change
    create_table :potatos do |t|
      t.string :recipe_name
      t.string :recipe_about
      t.string :recipe_image
      t.integer :user_id
      


      t.timestamps
    end
  end
end
