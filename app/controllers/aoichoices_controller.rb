class AoichoicesController < ApplicationController


def index
@question = Question.find(params[:question_id])
 @aoiquestion = Aoiquestion.find(params[:aoiquestion_id])
  @aoichoice = Aoichoice.find(params[:id])
  raise @aoichoice.to_yaml
end


end