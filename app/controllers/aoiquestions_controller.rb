class AoiquestionsController < ApplicationController


def index
@aoiquestions = Aoiquestion.all 


end

end