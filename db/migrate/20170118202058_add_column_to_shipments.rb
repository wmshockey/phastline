class AddColumnToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :commodity_internal_id, :integer
  end
end
