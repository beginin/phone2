class Cfu < ActiveRecord::Base
  attr_accessible :namecfu
  has_many :userlog
  validates :namecfu , :presence => true
end
