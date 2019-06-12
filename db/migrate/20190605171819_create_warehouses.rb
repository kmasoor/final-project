class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.integer :width_sqft
      t.integer :owner_id
      t.string :location
      t.string :neighborhood
      t.integer :max_length_sqft
      t.integer :max_width_sqft
      t.string :name

      t.timestamps
    end
  end
end
