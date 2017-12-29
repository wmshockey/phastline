class AddFlowUnitToSimulations < ActiveRecord::Migration
  def change
    add_column :simulations, :flow_unit, :string, :limit => 12
    add_column :simulations, :vol_unit, :string, :limit => 12
  end
end
