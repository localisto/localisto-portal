class HomeController < ApplicationController
  def index

  	if logged_in?
		u = User.find(current_user.id)
         if u.agencies.order('agency.position ASC').first != nil

        	@agency = u.agencies.order('agency.updated_at desc').first
        	@projects = Project.where(:agency_id => @agency.id, :disabled => '0').reverse_order
        	@subnav = [['More Projects', agency_path(@agency.id)], ['New Project', new_agency_project_path(@agency.id)], ['Agencies', agencies_path] ] 
        	@action = 'icons'
				else
			@subnav = [ ['New Age', new_agency_path], ['Agencies', agencies_path] ] 
			@action = 'noage'
			
		end

	else
 		@subnav = []
 		@action = 'nologin'
 	
	end
  
  end
end
