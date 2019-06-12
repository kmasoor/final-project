class ContractsController < ApplicationController
  
  def my_rentals
    
    @contracts = Contract.all
    
    @warehouses = Warehouse.all
    
    @potential_rentals = PotentialRental.all
    
    render("/home_page/home.html.erb")
    
  end
  
  def list
    @contracts = Contract.all

    render("contract_templates/list.html.erb")
  end

  def details
    @contract = Contract.where({ :id => params.fetch("id_to_display") }).first

    render("contract_templates/details.html.erb")
  end

  def blank_form
    @contract = Contract.new

    render("contract_templates/blank_form.html.erb")
  end

  def save_new_info
    @contract = Contract.new

    @contract.buyer_id = params.fetch("buyer_id")
    @contract.seller_id = params.fetch("seller_id")
    @contract.price = params.fetch("price")
    @contract.days = params.fetch("days")
    @contract.sqft_used = params.fetch("sqft_used")
    @contract.potential_rental_id = params.fetch("listing_id") 

    if @contract.valid?
      @contract.save

      redirect_to("/contracts", { :notice => "Contract created successfully." })
    else
      render("contract_templates/blank_form.html.erb")
    end
  end
  
  def rent_space
    
    @contract = Contract.new
    
    rental_id = params.fetch("potential_rental_id")
    
    rental = PotentialRental.where(:id => rental_id).first
    
    @contract.buyer_id = current_user.id
    @contract.seller_id = rental.owner.id
    @contract.price = rental.ask_price
    @contract.days = rental.days
    @contract.length_sqft = rental.length_sqft
    @contract.width_sqft = rental.width_sqft
    @contract.potential_rental_id = rental_id 
    
    if @contract.valid?
      @contract.save

      redirect_to("/", { :notice => "Contract created successfully." })
    else
      redirect_to("/potential_rentals")
    end

    
  end

  def prefilled_form
    @contract = Contract.where({ :id => params.fetch("id_to_prefill") }).first

    render("contract_templates/prefilled_form.html.erb")
  end

  def save_edits
    @contract = Contract.where({ :id => params.fetch("id_to_modify") }).first

    @contract.buyer_id = params.fetch("buyer_id")
    @contract.seller_id = params.fetch("seller_id")
    @contract.price = params.fetch("price")
    @contract.days = params.fetch("days")
    @contract.sqft_used = params.fetch("sqft_used")

    if @contract.valid?
      @contract.save

      redirect_to("/contracts/" + @contract.id.to_s, { :notice => "Contract updated successfully." })
    else
      render("contract_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @contract = Contract.where({ :id => params.fetch("id_to_remove") }).first

    @contract.destroy

    redirect_to("/", { :notice => "Contract deleted successfully." })
  end
  
  def create_contract_row
    c = Contract.new
    
    c.buyer_id = params.fetch("potential_rental")
    c.seller_id = params.fetch("potential_rental")
    c.price = params.fetch("potential_rental")
    c.length_sqft = params.fetch("potential_rental")
    c.width_sqft = params.fetch("potential_rental")
    #c.potential_rental_id = params.fetch("potential_rental")
    
      if c.valid?
    c.save
      end
     redirect_to("/") 
  end
end
  #  new_contract.seller_id = potential_rental_get.user_id
   # new_contract.price = potential_rental_get.ask_price
  #  new_contract.sqft_used = potential_rental.
    
#  buyer_id   :integer
#  seller_id  :integer
#  price      :string
#  days       :string
#  sqft_used  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
   # new_contract.buyer_id = params.fetch("buyer_id")
    
  #  new_contract.seller_id = params.fetch("seller_id")
    
#  end