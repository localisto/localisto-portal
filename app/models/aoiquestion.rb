class Aoiquestion < ActiveResource::Base
   self.site = Settings.api_host
   self.element_name = "question"
   self.format = :xml
   self.user = Settings.api_user_email
   self.password = Settings.api_user_password
   attr_accessor :name, :question_text, :ideas, :url, :information, :email, :password


end