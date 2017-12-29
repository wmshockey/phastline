class AddViscUnitToCommodities < ActiveRecord::Migration
  def change
    add_column :commodities, :visc_unit, :string, :limit => 12
    add_column :commodities, :dens_unit, :string, :limit => 12
    add_column :commodities, :temp_unit, :string, :limit => 12
    add_column :commodities, :pres_unit, :string, :limit => 12
  end
end
