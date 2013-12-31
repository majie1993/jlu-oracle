class Team < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  validates :name, presence: true
  validates :creator_id, presence: true
end
