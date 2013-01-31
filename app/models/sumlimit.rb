class Sumlimit < ActiveRecord::Base
  attr_accessible :money, :namelimit
  validates :namelimit, :money, :presence => true
  validates :money, :length => { :in => 1..5 }, :numericality => { :only_integer => true } 
  validates :namelimit, :uniqueness => true
end
