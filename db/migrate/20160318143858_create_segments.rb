class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :seg_id
      t.integer :line_seq
      t.float :length
      t.float :diameter
      t.float :thickness
      t.float :roughness
      t.float :mawp
      t.float :start_elev
      t.float :end_elev
      t.float :temperature
      t.string :start_point
      t.string :end_point
      t.references :pipeline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
