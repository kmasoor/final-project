class WarehousesController < ApplicationController
  def list
    @warehouses = Warehouse.all
#   
    render("warehouse_templates/list.html.erb")
  end

  def details
    @warehouse = Warehouse.where({ :id => params.fetch("id_to_display") }).first

    render("warehouse_templates/details.html.erb")
  end

  def blank_form
    @warehouse = Warehouse.new

    render("warehouse_templates/blank_form.html.erb")
  end

  def save_new_info
    @warehouse = Warehouse.new

    @warehouse.owner_id = params.fetch("owner_id")
    @warehouse.location = params.fetch("location")
    @warehouse.neighborhood = params.fetch("neighborhood")
    @warehouse.max_length_sqft = params.fetch("max_length_sqft")
    @warehouse.max_width_sqft = params.fetch("max_width_sqft")
    @warehouse.name = params.fetch("name")


    if @warehouse.valid?
      @warehouse.save



      redirect_to("/", { :notice => "Warehouse created successfully." })
    else
      render("warehouse_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @warehouse = Warehouse.where({ :id => params.fetch("id_to_prefill") }).first

    render("warehouse_templates/prefilled_form.html.erb")
  end

  def save_edits
    @warehouse = Warehouse.where({ :id => params.fetch("id_to_modify") }).first

    @warehouse.owner_id = current_user.id
    @warehouse.location = params.fetch("location")
    @warehouse.neighborhood = params.fetch("neighborhood")
    @warehouse.max_length_sqft = params.fetch("max_length_sqft")
    @warehouse.max_width_sqft = params.fetch("max_width_sqft")
    @warehouse.name = params.fetch("name")

    if @warehouse.valid?
      @warehouse.save

      redirect_to("/warehouses/" + @warehouse.id.to_s, { :notice => "Warehouse updated successfully." })
    else
      render("warehouse_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @warehouse = Warehouse.where({ :id => params.fetch("id_to_remove") }).first

    @warehouse.destroy

    redirect_to("/", { :notice => "Warehouse deleted successfully." })
  end
end
