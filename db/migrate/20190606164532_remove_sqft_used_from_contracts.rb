class RemoveSqftUsedFromContracts < ActiveRecord::Migration[5.1]
  def change
    remove_column :contracts, :sqft_used, :integer
  end
end
