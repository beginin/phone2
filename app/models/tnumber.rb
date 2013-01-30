class Tnumber < ActiveRecord::Base
  attr_accessible :block, :datein, :dateout, :sortnumber, :tarif_id, :voicenumber
  belongs_to :tarif
  
  validates :voicenumber, :presence => true, 
                          :length => { :is => 10 }, 
                          :numericality => { :only_integer => true }, 
                          :uniqueness => true
  validates :sortnumber, :uniqueness => true, :length => { :is => 7 }, :allow_blank => true
  validates :tarif_id, :presence => true
  
  def self.freetnumbers_id
    tnumberactive = Simnumlog.select(:tnumber_id).where("datestop  > current_timestamp")
    ta_id=Array.new
    tnumberactive.find_each do |d|
      ta_id=ta_id+[d.tnumber_id]
    end
    tnumberall = Tnumber.select(:id)
    tl_id=Array.new
    tnumberall.find_each do |d|
      tl_id = tl_id+[d.id]
    end
    tl_id - ta_id
  end
end
