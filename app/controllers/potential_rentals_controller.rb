class PotentialRentalsController < ApplicationController
  def list
  

   # @potential_rentals = PotentialRental.all

    @q = PotentialRental.ransack(params[:q])
    @potential_rentals = @q.result
    
    render("potential_rental_templates/list.html.erb")
  end

  def details
    @potential_rental = PotentialRental.where({ :id => params.fetch("id_to_display") }).first

    render("potential_rental_templates/details.html.erb")
  end

  def blank_form
    @potential_rental = PotentialRental.new

    render("potential_rental_templates/blank_form.html.erb")
  end

  def save_new_info
    @potential_rental = PotentialRental.new

   
    @potential_rental.warehouse_id = params.fetch("warehouse_id")
    @potential_rental.ask_price = params.fetch("ask_price")
    @potential_rental.user_id = params.fetch("user_id")
    @potential_rental.length_sqft = params.fetch("length_sqft")
    @potential_rental.width_sqft = params.fetch("width_sqft")
    @potential_rental.days = params.fetch("days")

    if @potential_rental.valid?
      @potential_rental.save

      redirect_to("/", { :notice => "Potential rental created successfully." })
    else
      render("potential_rental_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @potential_rental = PotentialRental.where({ :id => params.fetch("id_to_prefill") }).first

    render("potential_rental_templates/prefilled_form.html.erb")
  end

  def save_edits
    @potential_rental = PotentialRental.where({ :id => params.fetch("id_to_modify") }).first

    @potential_rental.warehouse_id = params.fetch("warehouse_id")
    @potential_rental.ask_price = params.fetch("ask_price")
    @potential_rental.user_id = params.fetch("user_id")
    @potential_rental.length_sqft = params.fetch("length_sqft")
    @potential_rental.width_sqft = params.fetch("width_sqft")
    @potential_rental.days = params.fetch("days")

    if @potential_rental.valid?
      @potential_rental.save

      redirect_to("/potential_rentals/" + @potential_rental.id.to_s, { :notice => "Potential rental updated successfully." })
    else
      render("potential_rental_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @potential_rental = PotentialRental.where({ :id => params.fetch("id_to_remove") }).first

    @potential_rental.destroy

    redirect_to("/", { :notice => "Potential rental deleted successfully." })
  end
  
  def search_storage_form
    
    render("potential_rental_templates/blank_search_form.html.erb")
    
  end
  
  def search_for_results
    
    render("potential_rental_templates/search_results.html.erb")
    
  end
  
  
end
