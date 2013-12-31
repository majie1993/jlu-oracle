class Teams_User < ActiveRecord::Base

  validates :user_id, presence: true
  validates :team_id, presence: true
end
