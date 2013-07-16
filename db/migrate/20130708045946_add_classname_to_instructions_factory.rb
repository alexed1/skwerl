class AddClassnameToInstructionsFactory < ActiveRecord::Migration
  def change
    add_column :instruction_factories, :classname, :string
  end
end
