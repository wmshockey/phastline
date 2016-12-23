class AddColumnLinefillToResults < ActiveRecord::Migration
  def change
    add_column :results, :linefill, :text
  end
end
