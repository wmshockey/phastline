class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :batch_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :activity_type
      t.float :volume
      t.string :source_location
      t.string :destination_location
      t.string :destination_facility
      t.string :shipper
      t.integer :nomination_id

      t.timestamps null: false
    end
  end
end
