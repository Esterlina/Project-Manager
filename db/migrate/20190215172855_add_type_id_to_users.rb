class AddTypeIdToUsers < ActiveRecord::Migration
  def change
  	 add_reference :users, :type, foreign_key: true
  end
end
