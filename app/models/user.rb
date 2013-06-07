class User < ActiveRecord::Base
  attr_accessible :fname, :mname, :sname
  has_many :userlog
  #accepts_nested_attributes_for :userlog
  validates :fname, :mname, :sname , :presence => true
  
  #def userlog_attributes=(userlog_attributes)
  #	attributes=userlog_attributes.first.fetch(1)
  #	userlog.build(attributes)
  #end

end
