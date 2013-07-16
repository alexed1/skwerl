class AddTypeToInstruction < ActiveRecord::Migration
  def change
    add_column :instructions, :type, :string
  end
end
