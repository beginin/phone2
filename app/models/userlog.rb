class Userlog < ActiveRecord::Base
  attr_accessible :cfu_id, :datestart, :datestop, :shedule_id, :sumlimit_id, :user_id
end
