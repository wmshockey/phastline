class AddNominationRefToShipments < ActiveRecord::Migration
  def change
    add_reference :shipments, :nomination, index: true, foreign_key: true
  end
end
