class AoiquestionsController < ApplicationController


def index
@aoiquestions = Aoiquestion.all 
end

def create
   @question = Question.find(params[:question_id])
   @project = Project.find(@question.project_id)
   @agency = Agency.find(@project.agency_id)
   @aoiquestion = Aoiquestion.create(params[:aoiquestion])
    @question.aoi_id = @aoiquestion.id
    #@question.sort_order = 99
    @question.save
   redirect_to agency_project_path(@agency, @project), notice: "Pairwise question created" 
end

def new
@question = Question.find(params[:question_id])
@aoiquestion = Aoiquestion.new
@aoiquestion.name = @question.description
end

def update

end


def show
	  @question = Question.find(params[:question_id])
      @aoiquestion = Aoiquestion.find(params[:id])
      
      raise @aoiquestion.to_yaml
	
end


end