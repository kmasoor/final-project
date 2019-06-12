# == Schema Information
#
# Table name: warehouses
#
#  id              :integer          not null, primary key
#  owner_id        :integer
#  location        :string
#  neighborhood    :string
#  max_length_sqft :integer
#  max_width_sqft  :integer
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Warehouse < ApplicationRecord

belongs_to :owner, :class_name => "User"
has_one :seller, :class_name => "PotentialRental", :dependent => :destroy


end
