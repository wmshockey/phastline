class AddStatusToSimulations < ActiveRecord::Migration[5.2]
  def change
    add_column :simulations, :status, :string
  end
end
