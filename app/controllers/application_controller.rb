class ApplicationController < ActionController::Base
  include ControllerAuthentication
	 #http_basic_authenticate_with :name => "localistobeta", :password => "pilot123"
  protect_from_forgery
end
