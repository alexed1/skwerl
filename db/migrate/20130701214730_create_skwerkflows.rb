class CreateSkwerkflows < ActiveRecord::Migration
  def change
    create_table :skwerkflows do |t|
      t.string :name

      t.timestamps
    end
  end
end
