class RenameNominationIDinActivities < ActiveRecord::Migration
  def change
    rename_column :activities, :nomination_id, :nomination_name
    change_column :activities, :nomination_name, :string
  end
end
