class Project < ActiveRecord::Base
  has_many :uploaders
  
  validates :name, presence: true
end
