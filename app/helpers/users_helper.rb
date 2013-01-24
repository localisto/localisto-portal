module UsersHelper


	def useractive_check(user)
	if user.localisto_staff == 1
		raw "<div class=\"statusdot syellow\" data-placement=\"right\" rel=\"tooltip\" title=\"This user is a Localisto Administrator\">&#9679;</div>"
	elsif user.is_active == 1
		raw "<div class=\"statusdot sgreen\" data-placement=\"right\" rel=\"tooltip\" title=\"This is an active user\" >&#9679;</div>"
	elsif user.is_active == 0
		raw "<div class=\"statusdot sred\" data-placement=\"right\" rel=\"tooltip\" title=\"This user is not active\">&#9679;</div>"
	
	end
end
end
