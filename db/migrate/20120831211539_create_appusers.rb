class CreateAppusers < ActiveRecord::Migration
  def change
    create_table :appusers do |t|

      t.timestamps
    end
  end
end
