class AddLengthSqftToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :length_sqft, :integer
  end
end
