ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    
    columns do
      column do
        panel "Ultimas Propiedades" do
          ul do
            Property.last(5).map do |property|
              li link_to(property.reference, admin_propiedade_path(property))
            end
          end
        end
      end
    end
    
  end # content
end
