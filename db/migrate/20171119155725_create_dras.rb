class CreateDras < ActiveRecord::Migration
  def change
    create_table :dras do |t|
      t.float :start_kmp
      t.float :end_kmp
      t.float :dra_percent

      t.timestamps null: false
    end
  end
end
