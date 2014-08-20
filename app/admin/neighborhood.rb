ActiveAdmin.register Neighborhood, as: "Barrios" do

  permit_params :name, :properties_count

  config.filters = false
  
  index do
    selectable_column
    id_column
    column("Nombre") { |neighborhood| neighborhood.name }
    column("Cantidad de propiedades") { |neighborhood| neighborhood.properties_count }
    actions
  end

  show :title => :name do |neighborhood|
    
    panel "Detalles del Barrio" do
      attributes_table_for neighborhood do
        row("Id") { neighborhood.id }
        row("Nombre") { neighborhood.name }
        row("Cantidad de propiedades") { neighborhood.properties_count }
        row("Creado") { neighborhood.created_at }
        row("Actualizado") { neighborhood.updated_at }
      end
    end

    panel "Propiedades" do
      table_for(neighborhood.properties) do
          column("Foto principal") { |property| link_to(image_tag(property.photo_url, :width => '100'), admin_propiedade_path(property)) }
          column("Referencia") {|property| link_to "#{property.reference}",  admin_propiedade_path(property) }
          column("Tipo de propiedad") { |property| link_to "#{property.property_type.name}", admin_tipo_de_propiedade_path(property.property_type) if property.property_type_id.present? }
      end
    end
  end

  form do |f|
    f.inputs "Detalles del Barrio" do
      f.input :name, label: "Nombre"
    end
    f.actions
  end


end
