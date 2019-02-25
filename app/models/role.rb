class Role < ActiveRecord::Base
	has_many :has_projects
  	has_many :projects, through: :has_projects
  	has_many :users, through: :has_projects
end
