class AddColumnTotalVolumeToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :total_volume, :float
  end
end
