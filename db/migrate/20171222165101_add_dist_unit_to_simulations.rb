class AddDistUnitToSimulations < ActiveRecord::Migration
  def change
    add_column :simulations, :dist_unit, :string, :limit => 12
    add_column :simulations, :pres_unit, :string, :limit => 12
    add_column :simulations, :energy_unit, :string, :limit => 12
    add_column :simulations, :power_unit, :string, :limit => 12
    add_column :simulations, :pmphead_unit, :string, :limit => 12
    add_column :simulations, :pmpflow_unit, :string, :limit => 12
  end
end
