class ResponcesController < ApplicationController


before_filter :own_agency

def own_agency
  question = Question.find(params[:question_id])
  project = Project.find(question.project_id)
  agency = project.agency_id
  if localisto_staff?
  elsif have_access? (agency)
  else
  redirect_to root_path, notice: 'Access Denied' 
  end
end



def index
      @question = Question.find(params[:question_id])
   @responces = @question.responces.order('answer.position ASC')
   #@subnav = [['Back', agency_project_path(@project.agency_id, @project), "btn back"]]

   respond_to do |format|
    format.html # index.html.erb
     format.json { render json: @questions }
    end
end




  # GET /responces/1
  # GET /responces/1.json
  def show
     @question = Question.find(params[:question_id])
     @responce = @question.responces.find(params[:id])
    @subnav = [['Back', project_question_path(@question.project_id, @question), "btn back"], ["Destroy", question_responce_path(@question.id, @responce.id), "", "", :delete, data: { confirm: "Are you sure?" }], ["Edit", edit_question_responce_path(@question.id, @responce.id)]]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @responce }
    end
  end

  # GET /responces/new
  # GET /responces/new.json
  def new
    #@responce = Responce.new
    @question = Question.find(params[:question_id])
    @responce = @question.responces.new
    #@subnav = [['Back', question_responces_path(@question), "btn back"]]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @responce }
    end
  end

  # GET /responces/1/edit
  def edit
    @question = Question.find(params[:question_id])
    @responce = @question.responces.find(params[:id])
  end

  # POST /responces
  # POST /responces.json
  def create
    @question = Question.find(params[:question_id])
    @responce = @question.responces.build(params[:responce])


      if @responce.save
          if params[:responce][:image].blank?

       redirect_to project_question_path(@question.project_id, @question.id), notice: 'Responce was successfully created.' 
       else
        render action: "crop"
      end

      else
       render action: "new" 
      end
    end


  # PUT /responces/1
  # PUT /responces/1.json
  def update
     @question = Question.find(params[:question_id])
    @responce = Responce.find(params[:id])
    
      if @responce.update_attributes(params[:responce])
           if params[:responce][:image].blank?
              redirect_to [@question,@responce], notice: 'Responce was successfully updated.' and return
        else
        render action: "crop" and return
              redirect_to @question, notice: 'Responce was successfully updated.' 

        end
      end
      else
      redirect_to @question, notice: 'Responce was successfully updated.' and return

        #render action: "edit" and return
      end
   
  

  # DELETE /responces/1
  # DELETE /responces/1.json
  def destroy
    @question = Question.find(params[:question_id])
    @responce = @question.responces.find(params[:id])
    @responce.destroy

    respond_to do |format|
      format.html { redirect_to project_question_path(@question.project_id, @question) }
      format.json { head :no_content }
    end
  end
end
