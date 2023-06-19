class AddUserIdToOimos < ActiveRecord::Migration[6.1]
  def change
    add_column :oimos, :user_id, :integer
  end
end
