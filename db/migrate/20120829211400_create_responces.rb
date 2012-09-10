class CreateResponces < ActiveRecord::Migration
  def change
    create_table :responces do |t|

      t.timestamps
    end
  end
end
