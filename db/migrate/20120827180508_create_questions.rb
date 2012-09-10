class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :type
      t.string :image
      t.string :description
      t.integer :aoi_id
      t.integer :sort_order

      t.timestamps
    end
  end
end
