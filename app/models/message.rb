class Message < ActiveRecord::Base
  attr_accessible :body, :recipient, :sender, :time
  
  #Validations
  validates :recipient, :body, :presence => true
  
  def self.text_to(phone, body)
    "https://www.sawanet.com/rsms/send?endpoint=cmu3071&number=#{phone}&text=\"#{body}\"&password=oneacrefund"
  end
  
  def self.split_numbers(string)
    phones = Array.new
    tmp = string.split(/,\s*|\r\n/)
    phones = tmp
    phones
  end

  def self.reformat_phone(phone)
    #phone.gsub!(/+\(?250\)?/,"")
    phone.gsub!(/[^0-9]/,"")
    phone
  end
  
  def self.count_recipients(string)
    phones = Array.new
    tmp = string.split(/,\s*|\r\n/)
    phones = tmp
    count = phones.size
    count
  end
  
  def self.reformat_time(time)
    time.strftime("%d/%m/%y")
    time
  end
end
