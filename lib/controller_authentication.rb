# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
#
#   <% if logged_in? %>
#     Welcome <%= current_user.username %>.
#     <%= link_to "Edit profile", edit_current_user_path %> or
#     <%= link_to "Log out", logout_path %>
#   <% else %>
#     <%= link_to "Sign up", signup_path %> or
#     <%= link_to "log in", login_path %>.
#   <% end %>
#
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
#
#   before_filter :login_required, :except => [:index, :show]
module ControllerAuthentication
  def self.included(controller)
    controller.send :helper_method, :current_user, :logged_in?, :localisto_staff?, :redirect_to_target_or_default, :user_rights
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

 

def user_rights(agency, user)
    u = User.find(user) 
  if u.localisto_staff == 1
     @r = "user is admin"
  else
   if logged_in?
     if u.is_active == 1
         #user logged in and active       
         a = u.agencies.find_by_id(agency)
           if a != nil
             #user loggedin, active, has agency
             "granted"    
           elsif a == nil 
             #user loggedin, active, does not have agency
             "denied"
           end
     else
        #user logged in and NOT active
         "notactive"
     end
   end
  end
end




  def localisto_staff?
    if logged_in?
     if current_user.localisto_staff == 1
      1
     else 
      nil
    end
  else
  end
 end


def have_access? (agency)
    if Portaluserassignment.where(:agency_id => agency, :user_id => current_user.id).count >= 1
      1
    else
      nil
end
end


  def login_required
    unless logged_in?
      store_target_location
      redirect_to login_url, :alert => "You must first log in or sign up before accessing this page."
    end
  end

  def redirect_to_target_or_default(default, *args)
    redirect_to(session[:return_to] || default, *args)
    session[:return_to] = nil
  end

  private

  def store_target_location
    session[:return_to] = request.url
  end
end
