class AddCountSprintToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :number_sprints, :integer
  	add_column :projects, :starting_date, :date
  	add_column :projects, :ending_date, :date
  end
end
