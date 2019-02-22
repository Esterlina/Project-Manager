class Project < ActiveRecord::Base
	has_many :has_projects
	has_many :users, through: :has_projects

	has_many :has_services
	has_many :services, through: :has_services
	
	def user_id=(user_ids)
		users = User.find(user_ids)
		users.each do |user|
			self.users << user
		end 
	end
	def service_id=(service_ids)
		unless service_ids.include? "1" 
			service_ids.append("1")
		end
		services = Service.find(service_ids)
		services.each do |service|
			self.services << service
		end 
	end
end
