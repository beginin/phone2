class Simlog < ActiveRecord::Base
  attr_accessible :datestart, :datestop, :sim_id, :user_id
  belongs_to :sim
  belongs_to :user

end
