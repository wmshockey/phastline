class AlterColumnPumpsDescription < ActiveRecord::Migration
  def change
    rename_column :pumps, :description_text, :description
    change_column :pumps, :description, :text
  end
end
