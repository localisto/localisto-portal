class HomeController < ApplicationController
  

def letsgetstarted
@subnav = []
end

  def index

  	if logged_in?
		u = User.find(current_user.id)
         if u.agencies.first != nil

        	@agency = u.agencies.order.first
        	@projects = Project.where(:agency_id => @agency.id).reverse_order
     
        	@action = 'icons'
				# if @projects.count == 0
        #	@subnav = [['More Projects', agency_path(@agency.id)], ['New Project', new_agency_project_path(@agency.id),"","","example","Your agency does not have any projects yet.  Click above to create one.","Create a project","popover","bottom"], ['Agencies', agencies_path] ] 
        #		else 
        #	@subnav = [['Projects(list view)', agency_path(@agency.id)], ['Create a New Project', new_agency_project_path(@agency.id)], ['All Your Agencies', agencies_path], ['Edit Agency Details', edit_agency_path(@agency)] ] 
#end
				else	
																			
			redirect_to letsgetstarted_path

			
		end

	else

 		@action = 'nologin'
 	
	end
  



  end
end
