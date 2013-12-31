class CreateTeamsAndUsers < ActiveRecord::Migration
  def change
    create_table :teams_users do |t|
      t.belongs_to :user
      t.belongs_to :team
    end
    add_index :teams_users, :user_id
    add_index :teams_users, :team_id
    add_index :teams_users, [:user_id, :team_id]
  end
end
