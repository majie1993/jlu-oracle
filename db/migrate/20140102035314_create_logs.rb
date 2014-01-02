class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.belongs_to :team
      t.string :content
      
      t.timestamps
    end
  end
end
