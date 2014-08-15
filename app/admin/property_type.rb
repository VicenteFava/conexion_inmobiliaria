ActiveAdmin.register PropertyType, as: "Tipo De Propiedades" do

  menu :parent => "Propiedades", :priority => 1

  permit_params :name

  index do
    selectable_column
    id_column
    column("Nombre") { |property_type| property_type.name }
    column("Cantidad de propiedades") { |property_type| property_type.properties_count }
    actions
  end

  show :title => :name do |property_type|
    
    panel "Detalles del Tipo de Propiedad" do
      attributes_table_for property_type do
        row("Id") { property_type.id }
        row("Nombre") { property_type.name }
        row("Cantidad de propiedades") { property_type.properties_count }
        row("Creado") { property_type.created_at }
        row("Actualizado") { property_type.updated_at }
      end
    end
  end

  form do |f|
    f.inputs "Detalles del Tipo de Propiedad" do
      f.input :name, label: "Nombre"
    end
    f.actions
  end
  
end
