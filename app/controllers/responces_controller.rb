class ResponcesController < ApplicationController
  # GET /responces
  # GET /responces.json
 

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
    #@responce = Responce.new(params[:responce])

    respond_to do |format|
      if @responce.save
        format.html { redirect_to project_question_path(@question.project_id, @question.id), notice: 'Responce was successfully created.' }
        format.json { render json: @responce, status: :created, location: @responce }
      else
        format.html { render action: "new" }
        format.json { render json: @responce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /responces/1
  # PUT /responces/1.json
  def update
    @responce = Responce.find(params[:id])

    respond_to do |format|
      if @responce.update_attributes(params[:responce])
        format.html { redirect_to [@question,@responce], notice: 'Responce was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @responce.errors, status: :unprocessable_entity }
      end
    end
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
