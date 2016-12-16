class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.string :name
      t.string :description
      t.date :nom_date
      t.float :period

      t.timestamps null: false
    end
  end
end
