class AddBatchSequenceDataToResults < ActiveRecord::Migration
  def change
    add_column :results, :batch_sequence_data, :text
  end
end
