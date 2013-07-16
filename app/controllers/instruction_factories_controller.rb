class InstructionFactoriesController < ApplicationController
  def new
      @instruction_factory = InstructionFactory.new()
  end

  def destroy

   @instruction_factory = InstructionFactory.find(params[:id])
   @instruction_factory.destroy
   redirect_to action: "index"
  end

  def edit
    @instruction_factory = InstructionFactory.find(params[:id])
  end

  def show
    @instruction_factory = InstructionFactory.find(params[:id])
  end

  def index
  	@instruction_factories = InstructionFactory.all
  end

  def create
  	@instruction_factory = InstructionFactory.new
  	@instruction_factory.name = params[:instruction_factory][:name]
    @instruction_factory.classname = params[:instruction_factory][:classname]
  	@instruction_factory.save
  	redirect_to action: "index"

  end

  # PATCH/PUT /instruction_factoryies/1
  # PATCH/PUT /instruction_factories/1.json
  def update
    @instruction_factory = InstructionFactory.find(params[:id]) 
    @instruction_factory.classname = params[:instruction_factory][:classname]
    @instruction_factory.name = params[:instruction_factory][:name]
    respond_to do |format|
      
      if @instruction_factory.save
        format.html { redirect_to @instruction_factory, notice: 'instruction_factory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @instruction_factory.errors, status: :unprocessable_entity }
      end
    end
  end

#private
 # def instruction_factory_params
  #  params.require(:instruction_factory).permit(:name, :classname)
  #end






end
