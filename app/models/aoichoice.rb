class Aoichoice < ActiveResource::Base

 
   self.site = Settings.api_host + "/questions/:aoiquestion_id/"
   self.user = Settings.api_user_email
   self.password = Settings.api_user_password
      self.element_name = "choice"
   self.format = :xml
    #belongs_to :aoiquestion
    
  # do i need this ?
  #def question_id
  #  prefix_options[:aoiquestion_id]
  #end

  def data
    attributes['data']
  end

  def prefix_options
  { :aoiquestion_id => aoiquestion_id }
end

end