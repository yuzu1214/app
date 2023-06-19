class CreateOimos < ActiveRecord::Migration[6.1]
  def change
    create_table :oimos do |t|
      t.string :shop_name
      t.string :shop_or_recipe
      t.string :adresses
      t.text :shop_about

      t.timestamps
    end
  end
end
