class Tnumber < ActiveRecord::Base
  attr_accessible :block, :datein, :dateout, :sortnumber, :tarif_id, :voicenumber, :tarif_text
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

  def self.uploadcsv(upload)
    require 'csv'
    content = upload['csv'].read
    detection = CharlockHolmes::EncodingDetector.detect(content)
    utf8_encoded_content = CharlockHolmes::Converter.convert content, detection[:encoding], 'UTF-8'
    #logger.debug "Привет #{utf8_encoded_content}"
    csvarray = CSV.parse(utf8_encoded_content, :col_sep => ';')

    csvarray.delete(csvarray.first)
    csvarray.each do |row|
      n = Tnumber.where(:voicenumber => row[0]).first || Tnumber.new(:voicenumber => row[0],
        :datein => Phone2::Application::config.timestart, :dateout => Phone2::Application::config.timeinfinity)
      n.tarif_text = row[1]
      n.block = (row[2] <=> "Заблокированный") == 0 ? true : false
      n.save
    end
  end


  def tarif_text
     tarif.try(:name)
  end

  def tarif_text=(name)
    self.tarif = Tarif.find_or_create_by_name(name) if name.present?
  end

end
