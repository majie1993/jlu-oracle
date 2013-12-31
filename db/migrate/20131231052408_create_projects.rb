class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.belongs_to :team
      
      t.timestamps
    end
  end
end
