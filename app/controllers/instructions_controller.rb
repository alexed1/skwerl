class InstructionsController < ApplicationController
  def new
  	@instruction = Instruction.new
    session[:set_id] = params[:set_id]
  end

	def create
		
		@instruction = Instruction.new

    #find the classname from the list of templates in the Factory table
    factory = InstructionFactory.find(params[:instruction_factory][:factory_id])
    #create the appropriate subclass instruction
    #set the friendly name of the instruction
    @instruction.name = factory.name
    #storing the classname in a column called "type" enables STI
    @instruction.type = factory.classname

    @instruction.add_to_skwerkflow(session[:set_id])
		@instruction.save


    #do a new query to access the subclasses get_view?

    #@new_instruction = factory.classname


    view_path = @instruction.get_view
    if view_path
      view_path << ".html.erb"
      render view_path
     else redirect_to :controller => "skwerkflows",  :action => "show", :id => session[:set_id]
     end
	end





	def destroy

   @instruction= Instruction.find(params[:id])
   @instruction.destroy
   redirect_to :controller => "skwerkflows",  :action => "show", :id => session[:set_id]
  end

  def show
  	 @instruction= Instruction.find(params[:id])
  	 
  	 #if this is a child class, ask it for the view
  	 if view_path = @instruction.get_view
  		view_path << ".html.erb"
      render view_path
  	 else render
  	 end
  end

  def edit
       logger.debug ("Editing Instruction : #{self.name}")
 
  end

  def index
       #redirect_to :controller => "skwerkflows",  :action => "index"
      @instructions = Instruction.all
  end

  def update
    @instruction = Instruction.find(params[:id]) 
    @instruction.name = params[:instruction][:name]
    @instruction.code = params[:instruction][:code]
    respond_to do |format|
      
      if @instruction.save
        format.html { redirect_to :controller => "skwerkflows",  :action => "show", :id => session[:set_id] }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end

  end
end
