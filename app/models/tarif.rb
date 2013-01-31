class Tarif < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :tnumber
  validates :name, :description, :presence => true
end
