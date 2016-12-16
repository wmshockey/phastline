class RenameIdColumns < ActiveRecord::Migration
  def change
     rename_column :results, :simulation_id_id, :simulation_id
     rename_column :results, :station_id_id, :station_id
  end
end
