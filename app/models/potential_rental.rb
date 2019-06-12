# == Schema Information
#
# Table name: potential_rentals
#
#  id           :integer          not null, primary key
#  warehouse_id :integer
#  ask_price    :integer
#  user_id      :integer
#  length_sqft  :integer
#  width_sqft   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  days         :integer
#

class PotentialRental < ApplicationRecord
    
    belongs_to :warehouse
    has_many :contracts, :foreign_key => "potential_rental_id", :dependent => :destroy
    
    has_one :owner, :through => :warehouse, :source => :owner
    
    validate :length_sqft_should_not_be_bigger_than_warehouse
    
    validate :width_sqft_should_not_be_bigger_than_warehouse
    
    def length_sqft_should_not_be_bigger_than_warehouse
      if self.warehouse.max_length_sqft < self.length_sqft
        errors.add(:length_sqft, "longer than warehouse max") 
      end
    end
    
    def width_sqft_should_not_be_bigger_than_warehouse
      if self.warehouse.max_width_sqft < self.width_sqft
        errors.add(:width_sqft, "wider than warehouse max") 
      end
    end
    
    
 #   def owner_name
        
  #      a = Warehouse.where({:warehouse_id => self.id}).first
   #     b = User.where({:id => a.owner_id})
    #    return b.username
    #end
    
end
