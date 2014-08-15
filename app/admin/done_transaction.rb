ActiveAdmin.register DoneTransaction, as: "Transacciones Realizadas" do

  #menu :parent => "Transacciones", :priority => 1
  
  permit_params :property_id, :client_id, :transaction_type, :transaction_price,
                :transaction_date, :transaction_end_date

  index do
    selectable_column 
    id_column
    column("Propiedad") { |t| link_to "#{t.property.reference}", admin_propiedade_path(t.property) }
    column("Tipo de transaccion") { |t| t.transaction_type }
    column("Precio de la transaccion") { |t| t.transaction_price }
    column("Fecha de fin de la transaccion") { |t| t.transaction_end_date }
    actions
  end

  filter :property, label: "Propiedad", as: :select, collection: Property.all.order('reference').map{|p| ["#{p.reference}", p.id]}
  filter :client, label: "Cliente"
  filter :transaction_type, label: "Tipo de transaccion", as: :select, collection: ["Alquiler","Alquiler de temporada", "Permutacion", "Venta"]
  filter :transaction_price, label: "Precio de la transaccion"
  filter :transaction_date, :as => :date_range, label: "Fecha de la transaccion"
  filter :transaction_end_date, :as => :date_range, label: "Fecha de fin de la transaccion"

  show :title => :id do |t|

    panel "Detalles de la transaccion" do
      attributes_table_for t do
        row("Id") { t.id }
        row("Propiedad") { link_to "#{t.property.reference}", admin_propiedade_path(t.property) }
        row("Cliente") { t.client }
        row("Tipo de transaccion") { |t| t.transaction_type }
        row("Precio de la transaccion") { |t| t.transaction_price }
        row("Fecha de la transaccion") { |t| t.transaction_date }
        row("Fecha de fin de la transaccion") { |t| t.transaction_end_date }
        row("Creado") { t.created_at }
        row("Actualizado") { t.updated_at }
      end
    end
  end

  form do |f|
    f.inputs "Detalles del Propietario" do
      f.input :property, label: "Propiedad", as: :select, collection: Property.all.order('reference').map{|p| ["#{p.reference}", p.id]}
      f.input :client, label: "Cliente"
      f.input :transaction_type, label: "Tipo de transaccion", as: :select, collection: ["Alquiler","Alquiler de temporada", "Permutacion", "Venta"]
      f.input :transaction_price, label: "Precio de la transaccion"
      f.input :transaction_date, :as => :date_picker, label: "Fecha de la transaccion"
      f.input :transaction_end_date, :as => :date_picker, label: "Fecha de fin de la transaccion"
    end
    f.actions
  end
  
end
