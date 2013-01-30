class Tnumber < ActiveRecord::Base
  attr_accessible :block, :datein, :dateout, :sortnumber, :tarif_id, :voicenumber
  belongs_to :tarif
  
  validates :voicenumber, :presence => true, 
                          :length => { :is => 10 }, 
                          :numericality => { :only_integer => true }, 
                          :uniqueness => true
  validates :sortnumber, :uniqueness => true, :length => { :is => 7 }, :allow_blank => true
  validates :tarif_id, :presence => true
end
