class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.float :kmp

      t.timestamps null: false
    end
  end
end
