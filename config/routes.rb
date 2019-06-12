Rails.application.routes.draw do
  # Routes for the Potential rental resource:

  # CREATE
  match("/new_potential_rental_form", { :controller => "potential_rentals", :action => "blank_form", :via => "get" })
  match("/insert_potential_rental_record", { :controller => "potential_rentals", :action => "save_new_info", :via => "post" })

  # READ
  match("/potential_rentals", { :controller => "potential_rentals", :action => "list", :via => "get" })
  match("/potential_rentals/:id_to_display", { :controller => "potential_rentals", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_potential_rental_form/:id_to_prefill", { :controller => "potential_rentals", :action => "prefilled_form", :via => "get" })
  match("/update_potential_rental_record/:id_to_modify", { :controller => "potential_rentals", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_potential_rental/:id_to_remove", { :controller => "potential_rentals", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Contract resource:

  # CREATE
  match("/new_contract_form", { :controller => "contracts", :action => "blank_form", :via => "get" })
  match("/insert_contract_record", { :controller => "contracts", :action => "save_new_info", :via => "post" })
  match("/create_contract_row", { :controller => "contracts", :action => "create_contract_row", :via => "get" })
  match("/rent_space", {:controller => "contracts", :action => "rent_space", :via => "post"})

  # READ
  #match("/contracts", { :controller => "contracts", :action => "list", :via => "get" })
  match("/contracts/:id_to_display", { :controller => "contracts", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_contract_form/:id_to_prefill", { :controller => "contracts", :action => "prefilled_form", :via => "get" })
  match("/update_contract_record/:id_to_modify", { :controller => "contracts", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_contract/:id_to_remove", { :controller => "contracts", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Potential rental resource:

  # CREATE
  match("/new_potential_rental_form", { :controller => "potential_rentals", :action => "blank_form", :via => "get" })
  match("/insert_potential_rental_record", { :controller => "potential_rentals", :action => "save_new_info", :via => "post" })


  # READ
  match("/potential_rentals", { :controller => "potential_rentals", :action => "list", :via => "get" })
  match("/potential_rentals/:id_to_display", { :controller => "potential_rentals", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_potential_rental_form/:id_to_prefill", { :controller => "potential_rentals", :action => "prefilled_form", :via => "get" })
  match("/update_potential_rental_record/:id_to_modify", { :controller => "potential_rentals", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_potential_rental/:id_to_remove", { :controller => "potential_rentals", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :users
  # Routes for the Warehouse resource:

  # CREATE
  match("/new_warehouse_form", { :controller => "warehouses", :action => "blank_form", :via => "get" })
  match("/insert_warehouse_record", { :controller => "warehouses", :action => "save_new_info", :via => "post" })

  # READ
  match("/warehouses", { :controller => "warehouses", :action => "list", :via => "get" })
  match("/warehouses/:id_to_display", { :controller => "warehouses", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_warehouse_form/:id_to_prefill", { :controller => "warehouses", :action => "prefilled_form", :via => "get" })
  match("/update_warehouse_record/:id_to_modify", { :controller => "warehouses", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_warehouse/:id_to_remove", { :controller => "warehouses", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match("/", { :controller => "contracts", :action => "my_rentals", :via => "get" })
  match("/search_storage_form", { :controller => "potential_rentals", :action => "search_storage_form", :via => "get"})
  match("/search_for_results", { :controller => "potential_rentals", :action => "search_for_results", :via => "get"})


end

