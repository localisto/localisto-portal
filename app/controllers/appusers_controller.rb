class AppusersController < ApplicationController
before_filter :rights

def rights

  if localisto_staff?
  else
  redirect_to root_path, notice: 'Access Denied' 
  end


end
  def index
    @appusers = Appuser.all
    @subnav = []
  end


  def destroy
    @appuser = Appuser.find(params[:id])
    @appuser.destroy    
    redirect_to appusers_url 
   
  end
end
