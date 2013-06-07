class Userlog < ActiveRecord::Base
  attr_accessible :cfu_id, :datestart, :datestop, :schedule_id, :sumlimit_id, :user_id
  belongs_to :user
  belongs_to :sumlimit
  belongs_to :cfu
  belongs_to :schedule
end
