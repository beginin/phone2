class Schedule < ActiveRecord::Base
  attr_accessible :timein, :timeout, :timeins
  has_many :userlog
  validates :timein , :timeout, :presence => true

  def times
  	self.timein.to_formatted_s(:time)  + " - " + self.timeout.to_formatted_s(:time)
  	
  end
end
