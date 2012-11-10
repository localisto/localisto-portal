class CreateUseranswers < ActiveRecord::Migration
  def change
    create_table :useranswers do |t|

      t.timestamps
    end
  end
end
