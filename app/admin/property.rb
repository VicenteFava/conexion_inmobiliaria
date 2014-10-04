ActiveAdmin.register Property, as: "Propiedades" do
  
  menu :parent => "Propiedades", :priority => 2

  permit_params :reference, :client_id, :for_sale, :for_rent, :for_season_rent, :for_permutation, :visible,
                :price, :property_type_id, :neighborhood_id, :description, :built_up, :lot_size, :construction_year,
                :state, :living, :living_dining, :dining, :lounge, :desk, :kitchen, :kitchenette,
                :suits, :bedrooms, :bathrooms, :heating_type, :garage, :common_expenses, :floor, :elevator, 
                :porter, :recreational_areas, :principal_photo, :created_at, :updated_at,
                :principal_photo_file_name, :principal_photo_content_type,
                :principal_photo_file_size, :principal_photo_updated_at,
                photos_attributes: [:id, :property_id, :photo, :photo_file_name, :photo_content_type,
                                    :photo_file_size, :photo_updated_at, :_destroy],
                done_transactions_attributes: [:id, :property_id, :client_id, :transaction_type, :transaction_date,
                                               :transaction_price, :transaction_end_date, :_destroy]

  index do
    selectable_column
    id_column
    column("Foto principal") { |property| link_to(image_tag(property.photo_url, :width => '100'), admin_propiedade_path(property)) }
    column("Referencia") { |property| property.reference }
    column("Tipo de propiedad") { |property| link_to "#{property.property_type.name}", admin_tipo_de_propiedade_path(property.property_type) if property.property_type_id.present? }
    column("Propietario") { |property| link_to "#{property.client.name}", admin_cliente_path(property.client_id) if property.client_id.present? }
    actions
  end

  filter :for_sale, label: "En venta"
  filter :for_rent, label: "En alquiler"
  filter :for_season_rent, label: "En alquiler de temporada"
  filter :for_permutation, label: "En permutacion"
  filter :visible, label: "Visible"
 
  filter :reference, label: "Referencia"
  filter :client_id, label: "Propietario", as: :select, collection: -> { Client.all.order('name').map{|u| ["#{u.id} - #{u.name}", u.id]} }
  filter :property_type, label: "Tipo de tropiedad"
  filter :neighborhood, label: "Barrio"
  filter :price, label: "Precio"
  filter :description, label: "Descripcion"
  filter :built_up, label: "Metros construidos"
  filter :lot_size, label: "Tamaño de terreno"
  filter :construction_year, label: "Año de construccion"
  filter :state, label: "Estado"
  
  filter :living, label: "Living"
  filter :living_dining, label: "Living Comedor"
  filter :dining, label: "Comedor"
  filter :lounge, label: "Estar"
  filter :desk, label: "Escritorio"
  filter :kitchen, label: "Cocina"
  filter :kitchenette
  filter :suits
  filter :bedrooms, label: "Cuartos"
  filter :bathrooms, label: "Baños"
  filter :heating_type, label: "Calefaccion"
  filter :garage, label: "Garage"

  filter :common_expenses, label: "Gastos comunes"
  filter :floor, label: "Piso"
  filter :elevator, label: "Ascensor"
  filter :porter, label: "Portero"
  filter :recreational_areas, label: "Areas recreacionales"

  show :title => :reference do |property|
    
    panel "Transacciones de la Propiedad" do
      attributes_table_for property do

        row("En venta") { property.for_sale.present? ? "Si" : "No" }
        row("En alquiler") { property.for_rent.present? ? "Si" : "No" }
        row("En alquiler de temporada") { property.for_season_rent.present? ? "Si" : "No" }
        row("En permutacion") { property.for_permutation.present? ? "Si" : "No" }
        row("Visible") { property.visible.present? ? "Si" : "No" } 
      end
    end

    panel "Datos de la Propiedad" do
      attributes_table_for property do
   
        row("Id") { property.id }
        row("Referencia") { property.reference }
        row("Propietario") { property.client }
        row("Tipo de propiedad") { property.property_type }
        row("Barrio") { property.neighborhood }
        row("Precio") { property.price }
        row("Descripcion") { property.description }
        row("Metros construidos") { property.built_up }
        row("Tamaño de terreno") { property.lot_size }
        row("Año de construccion") { property.construction_year }
        row("Estado") { property.state }
        row("Creado") { property.created_at }
        row("Actualizado") { property.updated_at }
        row("Foto principal") { image_tag(property.photo_url, :width => '500') }
      end
    end

    panel "Detalles de la Propiedad" do
      attributes_table_for property do

        row("Living") { property.living.present? ? "Si" : "No" }
        row("Living comedor") { property.living_dining.present? ? "Si" : "No" }
        row("Comedor") { property.dining.present? ? "Si" : "No" }
        row("Estar") { property.lounge.present? ? "Si" : "No" }
        row("Escritorio") { property.desk.present? ? "Si" : "No" }
        row("Cocina") { property.kitchen.present? ? "Si" : "No" }
        row("kitchenette") { property.kitchenette.present? ? "Si" : "No" }
        row("Suits") { property.suits }
        row("Cuartos") { property.bedrooms }
        row("Baños") { property.bathrooms }
        row("Tipo de calefaccion") { property.heating_type }
        row("Garage") { property.garage }
        row("Gastos comunes") { property.common_expenses }
        row("Piso") { property.floor }
        row("Ascensor") { property.elevator }
        row("Areas recreacionales") { property.recreational_areas }
      end
    end

    panel "Fotos de la Propiedad" do
      table_for property.photos  do
          column("Referencia") { |photo| link_to "#{photo.id}",  admin_foto_path(photo) }
          column("Foto") { |photo| image_tag(photo.url, :width => '500') }
      end
    end

    panel "Transacciones Realizadas de la Propiedad" do
      table_for property.done_transactions  do
          column("Cliente") { |t| link_to "#{t.client.name}", admin_cliente_path(t.client) }
          column("Tipo de Transaccion") { |t| t.transaction_type } 
          column("Precio de la Transaccion") { |t| t.transaction_price } 
          column("Fecha de la Transaccion") { |t| t.transaction_date }
          column("Fecha de fin de la Transaccion") { |t| t.transaction_end_date }
      end
    end

    panel "Visitas" do
      table_for(property.visits) do
        column("Cliente") { |visit| link_to "#{visit.client.name}", admin_cliente_path(visit.client) }
        column("Fecha") { |visit| visit.date }
      end
    end

  end


  form do |f|
    f.inputs "Transacciones de la Propiedad" do

      f.input :for_sale, label: "En venta"
      f.input :for_rent, label: "En alquiler"
      f.input :for_season_rent, label: "En alquiler de temporada"
      f.input :for_permutation, label: "En permutacion"
      f.input :visible, label: "Visible" 
    end

    f.inputs "Datos de la Propiedad" do

      f.input :client_id, :as => :select, collection: Client.order('name').all.map{|u| ["#{u.id} - #{u.name}", u.id]}, label: "Propietario"
      f.input :property_type, label: "Tipo de propiedad"
      f.input :neighborhood, label: "Barrio"
      f.input :price, label: "Precio"
      f.input :description, label: "Descripcion"
      f.input :built_up, label: "Metros construidos"
      f.input :lot_size, label: "Tamaño de terreno"
      f.input :construction_year, label: "Año de construccion"
      f.input :state, label: "Estado"
      f.input :principal_photo, label: "Foto principal", as: :file, :hint => f.template.image_tag(f.object.photo_url, :width => '500')
    end

    f.inputs "Detalles de la Propiedad" do
      
      f.input :living, label: "Living"
      f.input :living_dining, label: "Living comedor"
      f.input :dining, label: "Comedor"
      f.input :lounge, label: "Estar"
      f.input :desk, label: "Escritorio"
      f.input :kitchen, label: "Cocina"
      f.input :kitchenette, label: "kitchenette"
      f.input :suits, label: "Suits"
      f.input :bedrooms, label: "Cuartos"
      f.input :bathrooms, label: "Baños"
      f.input :heating_type, label: "Tipo de calefaccion"
      f.input :garage, label: "Garage"

      f.input :common_expenses, label: "Gastos comunes"
      f.input :floor, label: "Piso"
      f.input :elevator, label: "Ascensor"
      f.input :porter, label: "Portero"
      f.input :recreational_areas, label: "Areas recreacionales"

    end

    f.inputs "Transacciones Completadas de la Propiedad" do

      f.has_many :done_transactions, :heading => nil do |t|
        t.input :client, label: "Cliente"
        t.input :transaction_type, label: "Tipo de Transaccion", as: :select, collection: ["Alquiler","Alquiler de temporada", "Permutacion", "Venta"]
        t.input :transaction_price, label: "Precio de la Transaccion"
        t.input :transaction_date, :as => :date_picker, label: "Fecha de la Transaccion"
        t.input :transaction_end_date, :as => :date_picker, label: "Fecha de fin de la Transaccion"
      end
    end

    f.inputs "Fotos de la Propiedad" do
      f.has_many :photos, :heading => nil, :allow_destroy => true do |photo|
        photo.input :photo, as: :file, :hint => photo.template.image_tag(photo.object.url, :width => '500')
      end
    end

    f.actions
  end
  
end
