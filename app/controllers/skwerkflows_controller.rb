class SkwerkflowsController < ApplicationController

  def new
	end

	def index
			@skwerkflows = Skwerkflow.all
	end

  def destroy

   @skwerkflow= Skwerkflow.find(params[:id])
   @skwerkflow.destroy
   redirect_to :action => "index"
  end


	def create
		@skwerkflow = Skwerkflow.new()
    @skwerkflow.name = params[:skwerkflow][:name]
      if @skwerkflow.save
        session[:set_id] = @skwerkflow.id
        flash[:notice] = "Skwerkflow: #{@skwerkflow.name} was successfully created."
        redirect_to action: 'index'
      else
      	raise ("failed to save a skwerkflow")
      end
  end

  def execute
  	@skwerkflow = Skwerkflow.find(params[:id])
  	@instructions_list = Instruction.where(skwerkflow_id:  params[:id])
  	@instructions_list.each do |instruction|
  			instruction.execute
  	end
  	flash[:notice] = "Skwerkflow: #{@skwerkflow.name} was executed."
    redirect_to action: 'index'
  end

	def show
		@skwerkflow = Skwerkflow.find(params[:id])
		@instructions_list = Instruction.where(skwerkflow_id:  params[:id])
    session[:set_id] = params[:id]
	end

	#private
	#	def skwerkflow_params
	#		params.require(:skwerkflow).permit(:name)
	#	end
end
