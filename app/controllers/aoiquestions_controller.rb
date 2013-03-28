class AoiquestionsController < ApplicationController


def index
@aoiquestions = Aoiquestion.all 
end

def create
   @question = Question.find(params[:question_id])
   @aoiquestion = Aoiquestion.create(params[:aoiquestion])
    @question.aoi_id = @aoiquestion.id
    #@question.sort_order = 99
    @question.save
   redirect_to question_aoiquestions_path
end

def new
@question = Question.find(params[:question_id])
@aoiquestion = Aoiquestion.new
@aoiquestion.name = @question.description
end

def update

end


end