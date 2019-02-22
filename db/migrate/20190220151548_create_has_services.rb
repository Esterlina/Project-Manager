class CreateHasServices < ActiveRecord::Migration
  def change
    create_table :has_services do |t|
      t.references :project, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
    end
  end
end
