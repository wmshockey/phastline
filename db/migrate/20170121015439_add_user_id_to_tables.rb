class AddUserIdToTables < ActiveRecord::Migration
  def change
    add_column :simulations, :user_id, :integer
    add_column :commodities, :user_id, :integer
    add_column :pumps, :user_id, :integer
  end
end
