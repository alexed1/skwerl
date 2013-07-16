class Instruction < ActiveRecord::Base
  belongs_to :factory

  #:name
  #:factory_id
  #:skwerkflow_id
  #:code (probably not going to be used)

  #this allows child classes to use the main Instruction controller without errors. STI issue.
  def self.inherited(child)
    child.instance_eval do
      def model_name
        Instruction.model_name
      end
    end
    super
  end


  def add_to_skwerkflow(set_id)
  	@skwerkflow = Skwerkflow.find(set_id)
  	@skwerkflow.instructions << self


  end

  def execute

    logger.debug ("NO EXECUTION CODE FOR : #{self.name}")
  end

  #overridden by subclass to help controller find the right class-specific view.
  def get_view
    debugger
    puts "nil nil"
    return nil
  end

  debugger
  %w(S_create_web_page S_add_content_to_web_page).each {|r| require_dependency r } if Rails.env.development?
end
