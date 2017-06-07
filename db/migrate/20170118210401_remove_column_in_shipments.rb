class RemoveColumnInShipments < ActiveRecord::Migration
  def change
    remove_column :shipments, :commodity_internal_id
  end
end
