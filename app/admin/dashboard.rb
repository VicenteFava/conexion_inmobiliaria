ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    


    columns do
      column do
        panel "Ultimas Propiedades" do
          table_for Property.last(5) do
            column("Foto principal") { |property| link_to(image_tag(property.photo_url, :width => '100'), admin_propiedade_path(property)) }
            column("Referencia") { |property| link_to "#{property.reference}",  admin_propiedade_path(property) }
            column("Tipo de propiedad") { |property| link_to "#{property.property_type.name}", admin_tipo_de_propiedade_path(property.property_type) if property.property_type_id.present? }
            column("Barrio") { |property| link_to "#{property.neighborhood.name}", admin_barrio_path(property.neighborhood) if property.neighborhood.present? }
            column("Propietario") { |property| link_to "#{property.client.name}", admin_cliente_path(property.client) if property.client.present? }
          end
        end
      end
    end

    
    columns do
      column do
        panel "Proximas Visitas" do
          table_for Visit.where('date >= current_date').order('date').first(10) do
            column("Id") { |visit| link_to "#{visit.id}", admin_visita_path(visit) }
            column("Referencia") { |visit| link_to "#{visit.property.reference}", admin_propiedade_path(visit.property) if visit.property_id.present? }
            column("Cliente") { |visit| link_to "#{visit.client.name}", admin_cliente_path(visit.client) if visit.client_id.present? }
            column("Administrador") { |visit| link_to "#{visit.admin_user.email}", admin_administradores_path(visit.admin_user) if visit.admin_user_id.present? }
            column("Fecha") { |visit| visit.date }
          end
        end
      end
    end

    columns do
      column do
        panel "Algunas Tareas" do
          table_for Task.order("RANDOM()").first(10) do
            column("Id") { |task| link_to "#{task.id}", admin_tarea_path(task) }
            column("Cliente") { |task| link_to "#{task.client.name}", admin_cliente_path(task.client) if task.client_id.present? }
            column("Tarea") { |task| task.task }
          end
        end
      end
    end

  end # content
end
