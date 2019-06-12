class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.string :price
      t.string :days
      t.integer :sqft_used

      t.timestamps
    end
  end
end
