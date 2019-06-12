# == Schema Information
#
# Table name: contracts
#
#  id                  :integer          not null, primary key
#  buyer_id            :integer
#  seller_id           :integer
#  price               :string
#  days                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  length_sqft         :integer
#  width_sqft          :integer
#  potential_rental_id :integer
#

class Contract < ApplicationRecord

    belongs_to :buyer, :class_name => "User"
    belongs_to :rental, :class_name => "PotentialRental"

end
