class Third < Instruction


  def new

  end

	def execute
    newpage = WebPage.new
    newpage.name = Time.now.to_s
    newpage.setup
    logger.debug ("EXECUTING INSTRUCTION : #{self.name}")
  end

  def get_view
    return "V_Third"
  end


end
