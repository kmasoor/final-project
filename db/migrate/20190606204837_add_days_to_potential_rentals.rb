class AddDaysToPotentialRentals < ActiveRecord::Migration[5.1]
  def change
    add_column :potential_rentals, :days, :integer
  end
end
