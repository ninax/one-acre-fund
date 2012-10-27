class Message < ActiveRecord::Base
  attr_accessible :body, :recipient, :sender, :time
end
