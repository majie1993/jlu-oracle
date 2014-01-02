class Log < ActiveRecord::Base
  belongs_to :team
  
  validates :content, presence: true
end
