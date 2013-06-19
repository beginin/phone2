class Simlog < ActiveRecord::Base
  attr_accessible :datestart, :datestop, :sim_id, :type, :user_id
end
