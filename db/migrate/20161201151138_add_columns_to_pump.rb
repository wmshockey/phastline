class AddColumnsToPump < ActiveRecord::Migration
  def change
    add_column :pumps, :efficiency_correction_factor, :float
    add_column :pumps, :capacity_correction_factor, :float
    add_column :pumps, :head_correction_factor, :float
  end
end
