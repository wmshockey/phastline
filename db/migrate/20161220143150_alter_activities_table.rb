class AlterActivitiesTable < ActiveRecord::Migration
  def change
        add_column :activities, :station, :string
        remove_column :activities, :source_location
        remove_column :activities, :destination_location
        remove_column :activities, :destination_facility
  end
end
