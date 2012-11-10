class Appuser < ActiveRecord::Base
  self.table_name = 'user'
attr_accessible :id, :username, :email, :fb_gender, :fb_location, :fb_hometown, :fb_birthday
end
