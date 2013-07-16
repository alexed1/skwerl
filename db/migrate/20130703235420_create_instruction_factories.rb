class CreateInstructionFactories < ActiveRecord::Migration
  def change
    create_table :instruction_factories do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
