class Project < ActiveRecord::Base
  has_many :uploaders
  has_many :topics
  
  validates :name, presence: true
end
