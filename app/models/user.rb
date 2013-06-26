class User < ActiveRecord::Base
  attr_accessible :fname, :mname, :sname
  has_many :userlog
  has_many :simlog
  #accepts_nested_attributes_for :userlog
  validates :fname, :mname, :sname , :presence => true
  
  def fullname
  	self.sname.to_s + " " + self.fname.to_s + " " + self.mname.to_s 
  end
  #def userlog_attributes=(userlog_attributes)
  #	attributes=userlog_attributes.first.fetch(1)
  #	userlog.build(attributes)
  #end

  def owensims_id
    a=self.simlog.select(:sim_id).where("datestop  > current_timestamp ")  
    b=Array.new
    a.each do |d|
      b << d.sim_id
    end
    b
  end

  def owensims
    self.simlog.where("datestop  > current_timestamp ")
  end

end
