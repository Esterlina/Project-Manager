class Project < ActiveRecord::Base
	has_many :has_projects
	has_many :users, through: :has_projects
	has_many :roles, through: :has_projects

	has_many :has_services
	has_many :services, through: :has_services
	
	def user_id=(user_ids)
		user_ids.delete_if {|id| id.to_i.in?(get_users_ids)}
		users = User.find(user_ids)
		users.each do |user|
			self.users << user
		end 
	end
	def service_id=(service_ids)

		if get_services_ids
			unless service_ids.include? "1" 
				service_ids.append("1")
			end
		end
		service_ids.delete_if {|id| id.to_i.in?(get_services_ids)} 
		services = Service.find(service_ids)
		services.each do |service|
			self.services << service
		end 
	end
	def get_services_ids
		services_ids = HasService.where(project_id: self.id).pluck(:service_id)
	end
	def get_users_ids
		users_ids = HasProject.where(project_id: self.id).pluck(:user_id)
	end
	def update_role(user_id,role_id)
		hasProject = HasProject.where(project_id: self.id, user_id: user_id).take
		hasProject.update(role_id: role_id)
	end
end
