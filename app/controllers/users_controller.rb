class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  before_filter :localisto_staff?, :except => [:new, :create, :update]



def index
  @user = User.all
end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

    def adminedit
  @user = User.find(params[:id])
  end

  def addremoveagency
    @user = current_user
    @agencies = @user.agencies
  end

  
#def adminupdate
#    @user = User.find(params[:id])
    #user = current_user
    #if @user.update_attributes(:id => @user) 
     # redirect_to root_url, :notice => "Your profile has been updated. ********"
    #else
#    render :action => 'adminedit'
    #  end
#  end

  def update_profile
  @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to root_url, notice: 'User was successfully updated.'
    else
      render action: "adminedit" 
    end

end




  def update
    #@user = User.find(params[:id])
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
end
