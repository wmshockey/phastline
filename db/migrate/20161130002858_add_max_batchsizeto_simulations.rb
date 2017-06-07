class AddMaxBatchsizetoSimulations < ActiveRecord::Migration
  def change
    add_column :simulations, :max_batchsize, :float
  end
end
