class Topic < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :messages
  
  validates :name, presence: true
end
