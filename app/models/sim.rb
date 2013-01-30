class Sim < ActiveRecord::Base
  attr_accessible :sirealnumber
  has_many :simnumlog
  validates :sirealnumber, :length => { :in => 18..20 }, :numericality => { :only_integer => true }
  validates :sirealnumber, :uniqueness => true
end
