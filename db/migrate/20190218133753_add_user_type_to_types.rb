class AddUserTypeToTypes < ActiveRecord::Migration
  def change
    add_column :types, :user_type, :string
  end
end
