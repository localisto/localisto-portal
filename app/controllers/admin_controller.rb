class AdminController < ApplicationController

#before_filter :rights

def rights

  if localisto_staff?
  else
  redirect_to root_path, notice: 'Access Denied' 
  end
end


def index
	
end

def show

end


def unpublish
@agencies = Agency.where(:disabled => true)

	@agencies.each do |a|
	
				 @projects = a.projects.all
					@projects.each do |p|
						p.user_publish = 0
						p.save
				end
		end
	
	redirect_to admin_path, notice: "Its done"
end


end