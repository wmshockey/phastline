class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.float :kmp
      t.float :temperature
      t.references :pipeline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
