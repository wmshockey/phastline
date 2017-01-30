class AddColumnMaxsteptimeToSimulations < ActiveRecord::Migration
  def change
    add_column :simulations, :max_steptime, :float
  end
end
