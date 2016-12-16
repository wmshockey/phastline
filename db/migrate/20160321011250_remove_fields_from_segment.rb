class RemoveFieldsFromSegment < ActiveRecord::Migration
  def change
    remove_column :segments, :seg_id, :string
    remove_column :segments, :line_seq, :integer
    remove_column :segments, :length, :float
    remove_column :segments, :start_point, :float
    remove_column :segments, :end_point, :float
  end
end
