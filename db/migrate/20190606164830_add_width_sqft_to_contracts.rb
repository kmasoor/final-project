class AddWidthSqftToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :width_sqft, :integer
  end
end
