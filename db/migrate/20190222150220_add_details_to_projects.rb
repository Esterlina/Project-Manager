class AddDetailsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :detail, :string
  end
end
