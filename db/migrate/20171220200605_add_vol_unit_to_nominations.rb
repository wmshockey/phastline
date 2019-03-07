class AddVolUnitToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :vol_unit, :string, :limit => 12
  end
end
