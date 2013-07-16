class CreateInstructions < ActiveRecord::Migration
  def change
    change_table :instructions do |t|
      t.references :factory, index: true


    end
  end
end
