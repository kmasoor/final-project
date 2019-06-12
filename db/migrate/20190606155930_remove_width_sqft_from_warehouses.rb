class RemoveWidthSqftFromWarehouses < ActiveRecord::Migration[5.1]
  def change
    remove_column :warehouses, :width_sqft, :integer
  end
end
