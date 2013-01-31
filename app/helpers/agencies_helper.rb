module AgenciesHelper



def agency_published_alert(agency)
	
	if agency.user_publish == true and agency.admin_publish == false
		raw "<div class=\"alert alert-block\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button> <h4>This agency is <b>NOT</b> published</h4>You have published this agency and it is waiting for admin aproval before it will propagate to the Localisto Platform. In the mean time you can start creating and building projects </div>"
	elsif agency.user_publish == false and agency.admin_publish == true
		raw "<div class=\"alert alert-info alert-block \"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><h4>This agency is <b>NOT</b> published</h4>This agency has been pre-approved by the admin. Once you publish the agency will propagate to the Localisto Platform</div>"
	elsif agency.user_publish == false and agency.admin_publish == false
			raw "<div class=\"alert alert-error alert-block\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button><h4>This agency is <b>NOT</b> published</h4>This agency needs to be published by you. After being published it must be approved by the admin. </div>"	
	elsif agency.user_publish == true and agency.admin_publish == true
			raw "<div class=\"alert alert-success alert-block\"><b>This agency is published </b> and will show up on the Localisto Platform.</div>"	
	end
end


def published_check(agency)
	
	if agency.user_publish == true and agency.admin_publish == false
	raw "<div class=\"statusdot syellow\" data-placement=\"right\" rel=\"tooltip\" title=\"Waiting for administrator to publish\">&#9679;</div>"

	elsif agency.user_publish == false and agency.admin_publish == true
    raw "<div class=\"statusdot sblue\" data-placement=\"right\" rel=\"tooltip\" title=\"Waiting for user to publish\">&#9679;</div>"

	elsif agency.user_publish == false and agency.admin_publish == false
	raw "<div class=\"statusdot sred\" data-placement=\"right\" rel=\"tooltip\" title=\"Not published\">&#9679;</div>"


	elsif agency.user_publish == true and agency.admin_publish == true
	raw "<div class=\"statusdot sgreen\" data-placement=\"right\" rel=\"tooltip\" title=\"Publish\">&#9679;</div>"


	end
end




end