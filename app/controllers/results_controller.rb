class ResultsController < ApplicationController

  

layout "nolinks", :except => [:index]

  def index
    @project = Project.find(params[:project_id])
    @questions = @project.questions.order('question.position ASC')

    @results = Responce.where(:question_id=> @questions)

  end

  def indexnolinks
    @project = Project.find(params[:project_id])
    @questions = @project.questions.order('question.position ASC')

    @results = Responce.where(:question_id=> @questions)

  end

  
end
