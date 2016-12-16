class CreatePipelines < ActiveRecord::Migration
  def change
    create_table :pipelines do |t|
      t.string :name
      t.text :description
      t.decimal :length
      t.decimal :flowrate
      t.decimal :diameter
      t.decimal :roughness
      t.decimal :viscosity
      t.decimal :density
      t.decimal :lineloss
      t.decimal :total_loss

      t.timestamps null: false
    end
  end
end
