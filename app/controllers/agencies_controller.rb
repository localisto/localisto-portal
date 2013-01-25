class AgenciesController < ApplicationController



  


  def index

    if localisto_staff?
        @agencies = Agency.order('agency.position ASC')   
      else
        u = User.find(current_user.id)
        @agencies = u.agencies.order('agency.position ASC')
    end
@subnav = [["Home", root_path, "btn back"], ["New Agency", new_agency_path]]
end
  



def sort

      @agencies = Agency.all
        @agencies.each do |agency|
        agency.position = params['agency'].to_s.index(agency.id.to_s).to_i + 1
        agency.save
        end
      render :nothing => true
end


def reorder
  if localisto_staff?
      @agencies = Agency.order('agency.position ASC')
     @subnav = [["Home", root_path, "btn back"], ["New Agency", new_agency_path]]
  else
     redirect_to agencies_path, notice: 'You must be a Localisto Staff member to reorder' 
  end
end


  def show
    if localisto_staff?
    @agency = Agency.find(params[:id])
    @subnav = [ ['New Project', new_agency_project_path(@agency.id)] ] 
    else
    u = User.find(current_user.id)
    @agency = u.agencies.find(params[:id])
    @subnav = [ ['New Project', new_agency_project_path(@agency.id)] ] 
    end
  end


  def new
  
    @agency = Agency.new
      


  end


  def edit
    if localisto_staff?
    @agency = Agency.find(params[:id])
    else
    u = User.find(current_user.id)
    @agency = u.agencies.find(params[:id])
    end
  end


  def create
    @agency = Agency.new(params[:agency])
    
        pa = Portaluserassignment.new
        pa.user = current_user
        pa.agency = @agency 
        pa.save

      if @agency.save
        redirect_to @agency, notice: 'Agency was successfully created.' 
      else
         render action: "new" 
      end
    
  end


  def update
    if localisto_staff?
    @agency = Agency.find(params[:id])
    else
    u = User.find(current_user.id)
    @agency = u.agencies.find(params[:id])
    end
   

      if @agency.update_attributes(params[:agency])
        redirect_to @agency, notice: 'Agency was successfully updated.' 
       
      else
       render action: "edit" 
       
    
    end
  end


  def destroy
    if localisto_staff?
    @agency = Agency.find(params[:id])
     @agency.destroy
    else
    u = User.find(current_user.id)
    @agency = u.agencies.find(params[:id])
     @agency.destroy
    end
    

  
    redirect_to agencies_url 

  
  end
end
