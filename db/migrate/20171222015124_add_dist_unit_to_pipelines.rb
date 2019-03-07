class AddDistUnitToPipelines < ActiveRecord::Migration
  def change
    add_column :pipelines, :dist_unit, :string, :limit => 12
    add_column :pipelines, :diam_unit, :string, :limit => 12
    add_column :pipelines, :thick_unit, :string, :limit => 12
    add_column :pipelines, :ruff_unit, :string, :limit => 12
    add_column :pipelines, :pres_unit, :string, :limit => 12
    add_column :pipelines, :elev_unit, :string, :limit => 12
    add_column :pipelines, :temp_unit, :string, :limit => 12
  end
end
