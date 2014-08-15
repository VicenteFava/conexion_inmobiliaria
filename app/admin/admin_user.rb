ActiveAdmin.register AdminUser, :as => "Administradores" do

 #menu :parent => "Personas", :priority => 2

  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column("Email") { |admin| admin.email }
    actions
  end

  show :title => :email do |admin|
    
    panel "Detalles del Administrador" do
      attributes_table_for admin do
        row("Id") { |admin| admin.id }
        row("Email") { |admin| admin.email }
        row("Último ingreso") { |admin| admin.current_sign_in_at }
        row("Cantidad de ingresos") { |admin| admin.sign_in_count }
        row("Creado") { |admin| admin.created_at }
        row("Actualizado") { |admin| admin.updated_at }
      end
    end
  end

  filter :email

  form do |f|
    f.inputs "Detalles del Administrador" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
