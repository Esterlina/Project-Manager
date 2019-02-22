class CreateHasProjects < ActiveRecord::Migration
  def change
    create_table :has_projects do |t|
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
