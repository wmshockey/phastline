class CreateCommodities < ActiveRecord::Migration
  def change
    create_table :commodities do |t|
      t.string :commodity_id
      t.string :commodity_name
      t.float :temp1
      t.float :visc1
      t.float :temp2
      t.float :visc2
      t.float :density
      t.float :density_cf
      t.string :vapor

      t.timestamps null: false
    end
  end
end
