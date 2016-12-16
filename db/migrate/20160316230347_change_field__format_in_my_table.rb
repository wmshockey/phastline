class ChangeFieldFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :pipelines, :length, :float
    change_column :pipelines, :flowrate, :float
    change_column :pipelines, :diameter, :float
    change_column :pipelines, :roughness, :float
    change_column :pipelines, :viscosity, :float
    change_column :pipelines, :density, :float
  end
end
