class RemoveFieldsFromPipeline < ActiveRecord::Migration
  def change
    remove_column :pipelines, :length, :float
    remove_column :pipelines, :flowrate, :float
    remove_column :pipelines, :diameter, :float
    remove_column :pipelines, :roughness, :float
    remove_column :pipelines, :viscosity, :float
    remove_column :pipelines, :density, :float
    remove_column :pipelines, :lineloss, :float
    remove_column :pipelines, :total_loss, :float
  end
end
