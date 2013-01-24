class ProjectsController < ApplicationController



#before_filter :user_test

def user_test
  agency = Agency.find(params[:agency_id])
  a = agency.id
  u = User.find(current_user.id)
  r = user_rights(a, u)
  
  if r == "denied"
  redirect_to root_path, notice: 'Access Denied' 
  
  elsif r == "granted"
  
  elsif r == "notactive"
  redirect_to root_path, notice: 'You user is not active. Please contact support' 
  
  else
  redirect_to root_path, notice: 'Access Denied'  
  end
end




def index
    
    #@projects = Project.all
    @agency = Agency.find(params[:agency_id])
    @projects = @agency.projects.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

   def show
    #@project = Project.find(params[:id])

    @agency = Agency.find(params[:agency_id])
    @project = @agency.projects.find(params[:id])

    @subnav = [["Back", agency_path(@agency), "btn back"], ["Edit Details", edit_agency_project_path(@agency)], ["Edit Images", project_images_path(@project)], ["Add Image", new_project_image_path(@project)], ['Add Question', new_project_question_path(@project)], ['Edit Question', project_questions_path(@project)] ] 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def edit
    @agency = Agency.find(params[:agency_id])
    @project = @agency.projects.find(params[:id])

    @subnav = [['Back', agency_project_path(@agency, @project), "btn back"], ['Add Image', new_project_image_path(@project)]]

  end

  def update
    @agency = Agency.find(params[:agency_id])
    @project = @agency.projects.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to [@agency, @project], notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
def destroy
    #@project = Project.find(params[:id])
    #@project.destroy
    @agency = Agency.find(params[:agency_id])
    @project = @agency.projects.find(params[:id])
    @project.destroy



    respond_to do |format|
      format.html { redirect_to [@agency, @project] }
      format.json { head :no_content }
    end
  end




 # /agencys/1/projects/new
  def new
    @agency = Agency.find(params[:agency_id])
    @project = @agency.projects.new
   @subnav = [['Back', agency_path(@agency), "btn back"]]
   
  end




  def create
    @agency = Agency.find(params[:agency_id])
    @project = @agency.projects.build(params[:project])
     respond_to do |format|
      if @project.save
        format.html { redirect_to [@agency,@project], notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
end