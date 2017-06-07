class AddColumnToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :pipeline_id, :integer
  end
end
