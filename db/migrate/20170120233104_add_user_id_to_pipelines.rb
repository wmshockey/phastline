class AddUserIdToPipelines < ActiveRecord::Migration
  def change
    add_column :pipelines, :user_id, :integer
  end
end
