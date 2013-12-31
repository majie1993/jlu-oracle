class AddTimestampsToTeamsAndUsers < ActiveRecord::Migration
  def change
    add_column(:teams_users, :created_at, :datetime)
    add_column(:teams_users, :updated_at, :datetime)
  end
end
