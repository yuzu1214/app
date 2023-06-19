class AddImageToOimos < ActiveRecord::Migration[6.1]
  def change
    add_column :oimos, :image, :string
  end
end
