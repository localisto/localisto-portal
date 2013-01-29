class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      
        if user.agencies.count == 0
        redirect_to letsgetstarted_path, :notice => "You have no ageencies."
        else
          redirect_to_target_or_default root_url, :notice => "Logged in successfully."
        end
        
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end
end
