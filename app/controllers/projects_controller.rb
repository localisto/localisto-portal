class ProjectsController < ApplicationController



before_filter :agency_rights

def agency_rights
 if localisto_staff?
        @agency = Agency.find(params[:agency_id])
        else
      
        u = User.find(current_user.id)
        @agency = u.agencies.find(params[:agency_id])
end
end




def index
    
    @projects = @agency.projects.all

  end

   def show

    @project = @agency.projects.find(params[:id])

    @subnav = [["Back", agency_path(@agency), "btn back"], ["Edit Details", edit_agency_project_path(@agency)], ["Edit Images", project_images_path(@project)], ["Add Image", new_project_image_path(@project)], ['Add Question', new_project_question_path(@project)], ['Edit Question', project_questions_path(@project)]]
    @right_subnav = [['Publish', '#publish',"","modal" ],['Archive', '#archive',"","modal" ],['Delete', '#delete',"","modal" ]]
    
  end

  def edit

    @project = @agency.projects.find(params[:id])

    @subnav = [['Back', agency_project_path(@agency, @project), "btn back"], ['Add Image', new_project_image_path(@project)]]

  end

  def update

    @project = @agency.projects.find(params[:id])


      if @project.update_attributes(params[:project])
         redirect_to [@agency, @project], notice: 'Project was successfully updated.' 

      else
        render action: "edit" 
 
    end
  end
  
def destroy

    @project = @agency.projects.find(params[:id])
    @project.destroy
    redirect_to [@agency,], notice: 'Project was successfully deleted.' 
  end




 # /agencys/1/projects/new
  def new
    @agency = Agency.find(params[:agency_id])
    @project = @agency.projects.new
   @subnav = [['Back', agency_path(@agency), "btn back"]]
   
  end




  def create
    @project = @agency.projects.build(params[:project])
   
      if @project.save
     redirect_to [@agency,@project], notice: 'Project was successfully created.' 

      else
         render action: "new" 
 
     
    end
  end
end