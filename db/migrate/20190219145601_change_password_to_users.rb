class ChangePasswordToUsers < ActiveRecord::Migration
  def change
  	change_column_null :users, :encrypted_password, :string, true
  end
end
