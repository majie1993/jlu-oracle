class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.string :name
      t.text :content
      
      t.timestamps
    end
  end
end
