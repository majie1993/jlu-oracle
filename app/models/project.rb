class Project < ActiveRecord::Base
  has_many :uploaders
  has_many :tests
  
  validates :name, presence: true
end
