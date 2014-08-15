ActiveAdmin.register Client, as: "Clientes" do

  #menu :parent => "Personas", :priority => 3
  
  permit_params :name, :phone, :celluar, :optional_phone, :email

  index do
    selectable_column 
    id_column
    column("Nombre") { |client| client.name }
    column("Telefono") { |client| client.phone }
    column("Celular") { |client| client.celluar }
    column("Email") { |client| client.email }
    actions
  end

  filter :name, label: "Nombre"
  filter :phone, label: "Telefono"
  filter :celluar, label: "Celular"
  filter :optional_phone, label: "Telefono Opcional"
  filter :email, label: "Email"

  show :title => :name do |client|

    panel "Detalles del Cliente" do
      attributes_table_for client do
        row("Id") { client.id }
        row("Nombre") { client.name }
        row("Telefono") { client.phone }
        row("Celular") { client.celluar }
        row("Telefono Opcional") { client.optional_phone }
        row("Email") { client.email }
        row("Creado") { client.created_at }
        row("Actualizado") { client.updated_at }
      end
    end

    panel "Propiedades" do
      table_for(client.properties) do
          column("Propiedad") {|property| link_to "#{property.reference}",  admin_propiedade_path(property)}
      end
    end

    panel "Transacciones Realizadas" do
      table_for(client.done_transactions) do
          column("Propiedad") { |t| link_to "#{t.property.reference}",  admin_propiedade_path(t.property) }
          column("Tipo de transaccion") { |t| t.transaction_type }
          column("Precio de la transaccion") { |t| t.transaction_price }
          column("Fecha de la transaccion") { |t| t.transaction_date }
          column("Fecha de fin de la transaccion") { |t| t.transaction_end_date }
      end
    end
  end

  form do |f|
    f.inputs "Detalles del Propietario" do
      f.input :name, label: "Nombre"
      f.input :phone, label: "Telefono"
      f.input :celluar, label: "Celular"
      f.input :optional_phone, label: "Telefono opcional"
      f.input :email, label: "Email"
    end
    f.actions
  end
  
end