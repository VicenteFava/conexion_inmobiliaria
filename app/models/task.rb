class Task < ActiveRecord::Base
	belongs_to :client
	belongs_to :admin_user
end
