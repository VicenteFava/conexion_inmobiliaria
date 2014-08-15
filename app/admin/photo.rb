ActiveAdmin.register Photo, as: "Fotos" do

  menu :parent => "Propiedades", :priority => 3
  
  permit_params :property_id, :url, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at

  index do
    selectable_column
    id_column
    column("Propiedad") { |photo| link_to "#{photo.property.reference}", admin_propiedade_path(photo.property) }
    actions
  end

  filter :property_id, label: "Propiedad"


  show :title => :photo_file_name do |photo|

    panel "Detalles de la Foto" do
      attributes_table_for photo do
        row("Id") { photo.id }
        row("Propiedad") { link_to "#{photo.property.reference}", admin_propiedade_path(photo.property) }
        row("Nombre del archivo") { photo.photo_file_name }
        row("Tipo del archivo") { photo.photo_content_type }
        row("Tamaño del archivo") { photo.photo_file_size } 
        row("Archvio actualizado") { photo.photo_updated_at } 
        row("URL") { photo.url } 
        row("Creado") { photo.created_at }
        row("Actualizado") { photo.updated_at }
        row("Foto") { image_tag(photo.url) }
      end
    end
  end

  form do |f|
    f.inputs "Detalles de la Foto" do
      f.input :property_id, :as => :select, :collection => Property.order('reference').all.map{|p| ["#{p.reference}", p.id]}, label: "Propiedad"
      f.input :photo, as: :file, :hint => f.template.image_tag(f.object.url), label: "Foto"
    end
    f.actions
  end
  
end
