class AddFileToUploaders < ActiveRecord::Migration
  def change
    add_column :uploaders, :file, :string
  end
end
