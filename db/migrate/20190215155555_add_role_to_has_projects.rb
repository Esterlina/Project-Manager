class AddRoleToHasProjects < ActiveRecord::Migration
  def change
    add_reference :has_projects, :role, index: true, foreign_key: true
  end
end
