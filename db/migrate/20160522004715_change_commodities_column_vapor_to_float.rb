class ChangeCommoditiesColumnVaporToFloat < ActiveRecord::Migration
  def change
    change_column :commodities, :vapor, :float    
  end
end
