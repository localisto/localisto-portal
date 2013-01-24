module AgenciesHelper

def published_check(agency)
	if agency.user_publish == true
		raw "<div class=\"statusdot syellow\" data-placement=\"right\" rel=\"tooltip\" title=\"Waiting for Administrator to publish\">&#9679;</div>"
	elsif agency.disabled == true
		raw "<div class=\"statusdot sred\" data-placement=\"right\" rel=\"tooltip\" title=\"Not published\" >&#9679;</div>"
	elsif agency.disabled == false
		raw "<div class=\"statusdot sgreen\" data-placement=\"right\" rel=\"tooltip\" title=\"Published\">&#9679;</div>"
	
	end
end
	
end
