class ProblemStatementController < ApplicationController
	
	def create
		@problem_statement = ProblemStatement.new(problemstatement_params)
    if @problem_statement.save
      redirect_to problem_statement_index_path
    else
      render "new"
    end
	end

	def edit
	end

 def index 
 	 redirect_to root_path
 end
	def new
		p "*&*******************"
		@problemstatement = ProblemStatement.new
		p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
	end

	def update
	end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
   
  def problemstatement_params
    params.require(:problem_statement).permit(:name,:description,:attachment,:user_id,:tags,:start_date,:end_date)
  end

end
