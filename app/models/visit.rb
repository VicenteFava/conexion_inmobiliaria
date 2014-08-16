class Visit < ActiveRecord::Base
	belongs_to :property
	belongs_to :client
	belongs_to :admin_user
end
