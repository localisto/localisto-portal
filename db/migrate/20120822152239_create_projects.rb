class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :agency_id
      t.string :description
      t.string :location
      t.string :display_location

      t.timestamps
    end
  end
end
