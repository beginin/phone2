class Loadcall < ActiveRecord::Base
  attr_accessible :admin, :date
  has_many :calllog
end
