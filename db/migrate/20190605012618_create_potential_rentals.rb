class CreatePotentialRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :potential_rentals do |t|
      t.integer :warehouse_id
      t.integer :ask_price
      t.integer :user_id
      t.integer :length_sqft
      t.integer :width_sqft

      t.timestamps
    end
  end
end
