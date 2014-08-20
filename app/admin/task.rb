ActiveAdmin.register Task, as: "Tareas" do

  menu :parent => "Agenda", :priority => 1

  config.filters = false
  
  permit_params :client_id, :admin_user_id, :task

  index do
    selectable_column
    id_column
    column("Nombre del cliente") { |task| link_to "#{task.client.name}", admin_cliente_path(task.client_id) if task.client_id.present? }
    column("Administrador") { |task| link_to "#{task.admin_user.email}", admin_administradores_path(task.admin_user) if task.admin_user_id.present? }
    actions
  end

  show :title => :id do |task|
    
    panel "Detalles de la Tarea" do
      attributes_table_for task do
        row("Id") { task.id }
        row("Cliente") { task.client }
        row("Administrador") { task.admin_user }
        row("Tarea") { task.task }
      end
    end
  end

  form do |f|
    f.inputs "Detalles de la Tarea" do
      f.input :client, label: "Cliente"
      f.input :admin_user, label: "Administrador", as: :select, collection: AdminUser.order('email').all.map { |a| ["#{a.email}", a.id] }
      f.input :task, label: "Tarea"
    end
    f.actions
  end
end
