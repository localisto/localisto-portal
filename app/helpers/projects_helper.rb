module ProjectsHelper
	def project_published_alert(project)
	
	if project.user_publish == true and project.admin_publish == false
		raw "<div class=\"alert alert-block\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button> <h4>This project is <b>NOT</b> published</h4>You have published this project and it is waiting for admin aproval </div>"
	elsif project.user_publish == false and project.admin_publish == true
		raw "<div class=\"alert alert-info alert-block \"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><h4>This project is <b>NOT</b> published</h4>This project has been approved by the admin and is waiting for you to publish</div>"
	elsif project.user_publish == false and project.admin_publish == false
			raw "<div class=\"alert alert-error alert-block\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><h4>This project is <b>NOT</b> published</h4>This project needs to be published by you. After being published it must be approved by the admin. </div>"	
	elsif project.user_publish == true and project.admin_publish == true
			raw "<div class=\"alert alert-success alert-block\"><b>This project is published </b> and will show up on the Localisto Platform.</div>"	
	end
end
end
