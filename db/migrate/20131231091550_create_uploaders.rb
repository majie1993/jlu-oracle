class CreateUploaders < ActiveRecord::Migration
  def change
    create_table :uploaders do |t|
      t.belongs_to :project
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
