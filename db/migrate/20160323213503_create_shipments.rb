class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :start_location
      t.string :end_location
      t.string :shipper
      t.string :commodity_id
      t.float :volume

      t.timestamps null: false
    end
  end
end
