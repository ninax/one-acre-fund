class Message < ActiveRecord::Base
  attr_accessible :body, :recipient, :sender, :time
  
  #Validations
  validates :recipient, :body, :presence => true
end
