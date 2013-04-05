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

def outofdateprojects
@projects = Project.find(:all, :conditions => ["meeting_starts < ? AND disabled = ?", 1.days.ago, 0])

end

def unpublishoutofdateprojects
@projects = Project.find(:all, :conditions => ["meeting_starts < ? AND disabled = ?", 1.days.ago, 0])

pcount = @projects.count
 @projects.each do |p|
 	p.user_publish = 0

 	p.save
end
 redirect_to admin_path, notice: "You have unpublish #{pcount} projects"
end

def editdefaultorder
@agencies = Agency.where(:included_by_default => 1)
end

def allprojectimages
@projects = Project.all
end




end