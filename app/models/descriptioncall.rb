class Descriptioncall < ActiveRecord::Base
  attr_accessible :fin, :name
  has_many :calllog
end
