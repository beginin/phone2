class User < ActiveRecord::Base
  attr_accessible :fname, :mname, :sname
  has_many :userlog
  validates :fname, :mname, :sname , :presence => true
  
end
