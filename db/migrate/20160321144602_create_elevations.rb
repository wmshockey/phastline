class CreateElevations < ActiveRecord::Migration
  def change
    create_table :elevations do |t|
      t.float :kmp
      t.float :elevation
      t.references :pipeline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
