class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.integer :included_by_default
      t.integer :sort_order

      t.timestamps
    end
  end
end
