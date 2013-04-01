class QuestionsController < ApplicationController

before_filter :own_agency, :except => [:sort, :reorder]

def own_agency
  project = Project.find(params[:project_id])
  agency = project.agency_id
  if localisto_staff?
  elsif have_access? (agency)
  else
  redirect_to root_path, notice: 'Access Denied' 
  end
end


def index
   @project = Project.find(params[:project_id])
   @questions = @project.questions.order('question.position ASC')
   #@subnav = [['Back', agency_project_path(@project.agency_id, @project), "btn back"]]

   respond_to do |format|
    format.html # index.html.erb
     format.json { render json: @questions }
    end
end

def sort
@project = Project.find(params[:project_id])
@questions = @project.questions.all
#params[:questions].each_with_index do |id, index|
#Question.update_all(['position=?', index+1], ['id=?', id])

@questions.each do |question|
question.position = params['question'].to_s.index(question.id.to_s).to_i + 1
question.save
end
render :nothing => true
end

def reorder
 @project = Project.find(params[:project_id])
   @questions = @project.questions.order('question.position ASC')
   #@subnav = [['Back', agency_project_path(@project.agency_id, @project), "btn back"]]

   respond_to do |format|
    format.html # index.html.erb
     format.json { render json: @questions }
    end
end



def show
    @project = Project.find(params[:project_id])
    @question = @project.questions.find(params[:id])
   


 @subnav = [["Back", agency_project_path(@project.agency_id, @project.id), "btn back"], ["Edit Question", edit_project_question_path(@question.project_id, @question)], ["Add Responce", new_question_responce_path(@question.id)], ["Reorder", question_responces_path(@question)], ["Destroy", project_question_path(@question.project_id, @question), "", "", "1"]]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    #@question = Question.new
    @project = Project.find(params[:project_id])
    @question = @project.questions.new
    @subnav = [['Back', agency_project_path(@project.agency_id, @project), "btn back"]]




    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    #@question = Question.find(params[:id])
    @project = Project.find(params[:project_id])
    @question = @project.questions.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    #@question = Question.new(params[:question])
    @project = Project.find(params[:project_id])

    @question = @project.questions.build(params[:question])

        if @project.questions.where(:qtype => '3').count >= 1
          @a = Agency.find(@project.agency_id)
         redirect_to agency_project_path(@project.agency_id, @project.id), notice: 'You may only have one Pairwise Question per project' and return
         end 

      if @question.save
            if params[:question][:qtype] == '3'
             redirect_to new_question_aoiquestion_path(@question)
            elsif params[:question][:qtype] == '1'
              render action: "crop"
            else
               redirect_to project_question_path(@project.id, @question.id), notice: 'Question was successfully created. a' 
      end
      
      else

        redirect_to agency_project_path(@project.agency_id, @project.id), notice: 'Question was NOT successfully created.' 
 
      end

  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
        @project = Project.find(params[:project_id])

    @question = Question.find(params[:id])

  
      if @question.update_attributes(params[:question])
         
          if params[:question][:qtype] == '1'
           
              if params[:question][:image].blank?
                redirect_to project_question_path(@question.project_id, @question.id), notice: 'Question was successfully updated.' 
              else
                render action: "crop" and return
              end
              
              #redirect_to(project_question_path(@question.project_id, @question.id)) 

           end
     
        redirect_to project_question_path(@question.project_id, @question.id), notice: 'Question was successfully updated.' and return 


end
 render action: "new" and return
end
    
  def destroy
    #@question = Question.find(params[:id])
    #@question.destroy
    @project = Project.find(params[:project_id])
    @question = @project.questions.find(params[:id])
    @question.destroy


    respond_to do |format|
      format.html { redirect_to project_questions_path(@question.project.id, @question) }
      format.json { head :no_content }
    end
  end




end
