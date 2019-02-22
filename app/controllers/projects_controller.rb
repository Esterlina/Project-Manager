class ProjectsController < ApplicationController
	before_action :authenticate_user!
	before_action :user_manager_project, except: [:show,:index]
	def index
		@projects = Project.all
	end
	def show
	end
	def new
		@project = Project.new
		@people = User.all
		@services = Service.all
	end
	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to root_path
		else
			render :new
		end
	end
	def edit
		@roles = Role.all
	end
	def update
		if @project.update(project_params)
			redirect_to @project
		else
			render :edit
		end
	end	

	private
  	def user_manager_project
  		unless current_user.type.user_type == 'Admin' || current_user.type.user_type == 'Manager'
		  redirect_to root_path
		end
  	end
  	def project_params
		params.require(:project).permit(:name,:code,:detail,:number_sprints,:starting_date,:ending_date, user_id: [] , service_id: [] )
	end
end
