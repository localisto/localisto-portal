class CreatePortaluserassignments < ActiveRecord::Migration
  def change
    create_table :portaluserassignments do |t|

      t.timestamps
    end
  end
end
