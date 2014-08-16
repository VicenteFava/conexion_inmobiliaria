ActiveAdmin.register Visit, as: "Visitas" do

  menu :parent => "Agenda", :priority => 2
  
  config.filters = false

  permit_params :property_id, :client_id, :admin_user_id, :date, :time

  index do
    selectable_column
    id_column
    column("Propiedad") { |visit| link_to "#{visit.property.reference}", admin_propiedade_path(visit.property) if visit.property_id.present? }
    column("Nombre del cliente") { |visit| link_to "#{visit.client.name}", admin_cliente_path(visit.client) if visit.client_id.present? }
    column("Administrador") { |visit| link_to "#{visit.admin_user.email}", admin_administradores_path(visit.admin_user) if visit.admin_user_id.present? }
    column("Fecha") { |visit| visit.date }
    actions
  end

  show :id => :id do |visit|
    
    panel "Detalles de la Tarea" do
      attributes_table_for visit do
        row("Id") { visit.id }
        row("Propiedad") { link_to "#{visit.property.reference}", admin_propiedade_path(visit.property) if visit.property.present? }
        row("Cliente") { visit.client }
        row("Administrador") { visit.admin_user }
        row("Fecha") {visit.date}
        row("Hora") { visit.time.strftime('%H:%M') if visit.time.present? }
      end
    end
  end

  form do |f|
    f.inputs "Detalles de la Tarea" do
      f.input :property, label: "Propiedad", as: :select, collection: Property.order('reference').all.map { |p| ["#{p.reference}", p.id] }
      f.input :client, label: "Cliente"
      f.input :admin_user, label: "Administrador", as: :select, collection: AdminUser.order('email').all.map { |a| ["#{a.email}", a.id] }
      f.input :date, label: "Fecha", as: :date_picker
      f.input :time, label: "Hora"
    end
    f.actions
  end
end
