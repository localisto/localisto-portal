class Result < ActiveRecord::Base
 	self.table_name = 'user_answer'
   attr_accessible :user_id, :answer_id 
end
