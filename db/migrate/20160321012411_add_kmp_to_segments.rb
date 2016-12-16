class AddKmpToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :kmp, :float
  end
end
