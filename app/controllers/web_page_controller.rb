class WebPageController < ApplicationController

	def new
    newpage = WebPage.new
    newpage.name = Time.now.to_s
    newpage.setup

  end




end
