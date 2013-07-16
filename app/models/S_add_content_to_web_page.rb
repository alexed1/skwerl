class SAddContentToWebPage < Instruction
	

	def execute(content, webpage)
    #find webpage object
    #replace contents of "html" attribute with new content
    #save the object and trigger an update of the file
  end

  def get_view
  	return "V_add_content_to_web_page"
  end

   def new
     logger.debug ("NO New Config Method  FOR : #{self.name}")
  end

  def edit
     logger.debug ("NO edit Config Method  FOR : #{self.name}")
  end

  def show
     logger.debug ("NO show Config Method  FOR : #{self.name}")
  end
end
