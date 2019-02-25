 class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :has_projects
  has_many :projects, through: :has_projects
  has_many :roles, through: :has_projects
  belongs_to :type

  def get_project_role(project_id)
  	role = HasProject.where(project_id: project_id, user_id: self.id).take.role
  end
end
