class AddColumnHhpToResults < ActiveRecord::Migration
  def change
    add_column :results, :hhp, :float
  end
end
