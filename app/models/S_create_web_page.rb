class SCreateWebPage < Instruction


  def new

  end

	def execute
    newpage = WebPage.new
    newpage.name = Time.now.to_s
    newpage.setup
    logger.debug ("EXECUTING INSTRUCTION : #{self.name}")
  end

  def get_view
    debugger
    puts "foo"
    return "V_create_web_page"
  end


end
