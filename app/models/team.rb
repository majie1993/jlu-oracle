class Team < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :projects
  has_many :logs
  
  validates :name, presence: true
  validates :creator_id, presence: true
end
