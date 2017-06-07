class AddCoefsColumnToCommodities < ActiveRecord::Migration
  def change
    add_column :commodities, :acoef, :float
    add_column :commodities, :bcoef, :float
  end
end
