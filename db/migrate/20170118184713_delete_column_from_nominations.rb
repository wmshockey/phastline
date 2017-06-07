class DeleteColumnFromNominations < ActiveRecord::Migration
  def change
    remove_column :nominations, :pipeline_name
  end
end
