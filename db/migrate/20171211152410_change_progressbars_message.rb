class ChangeProgressbarsMessage < ActiveRecord::Migration
  def change
    change_column :progressbars, :message, :text
  end
end
