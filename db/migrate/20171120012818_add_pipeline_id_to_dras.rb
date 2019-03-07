class AddPipelineIdToDras < ActiveRecord::Migration
  def change
    add_column :dras, :pipeline_id, :integer
  end
end
