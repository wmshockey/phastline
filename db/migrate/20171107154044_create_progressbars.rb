class CreateProgressbars < ActiveRecord::Migration
  def change
    create_table :progressbars do |t|
      t.string :message
      t.integer :percent
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
