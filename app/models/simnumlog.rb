class Simnumlog < ActiveRecord::Base
  attr_accessible :datestart, :datestop, :sim_id, :tnumber_id
  belongs_to :sim
  belongs_to :tnumber
end
