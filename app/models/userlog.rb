class Userlog < ActiveRecord::Base
  attr_accessible :cfu_id, :datestart, :datestop, :schedule_id, :sumlimit_id, :user_id, :cfu_text
  belongs_to :user
  belongs_to :sumlimit
  belongs_to :cfu
  belongs_to :schedule


  def cfu_text
     cfu.try(:namecfu)
  end

  def cfu_text=(name)
    self.cfu = Cfu.find_or_create_by_namecfu(name) if name.present?
  end

end
