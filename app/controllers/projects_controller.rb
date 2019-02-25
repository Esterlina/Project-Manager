class ProjectsController < ApplicationController
	before_action :authenticate_user!
	before_action :user_manager_project, except: [:show,:index]
	before_action :set_project, except: [:index,:new,:create, :set_role, :update_role]
	before_action :set_project_role, only: [:set_role,:update_role]
	def index
		@projects = Project.all
	end
	def show
		@roles = Role.all
	end
	def new
		@project = Project.new
		@people = User.all
		@services = Service.all
	end
	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to @project
		else
			render :new
		end
	end
	def edit
		@roles = Role.all
		@people = User.all
		@services = Service.all
	end
	def update
		if @project.update(project_params)
			redirect_to @project
		else
			render :edit
		end
	end	
	def set_role
		@user = User.find(params[:user_id])
		@roles = Role.all
		#
	end
	def update_role
		user_id = params[:project][:user_id]
		role_id = params[:project][:role_id]
		if @project.update_role(user_id,role_id)
			redirect_to @project
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
	def set_project_role
		@project = Project.find(params[:project_id])
	end
	def set_project
		@project = Project.find(params[:id])
	end
end
