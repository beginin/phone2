class Sim < ActiveRecord::Base
  attr_accessible :sirealnumber
  has_many :simnumlog
  has_many :simlog
  validates :sirealnumber, :length => { :in => 18..20 }, :numericality => { :only_integer => true }
  validates :sirealnumber, :uniqueness => true
  
  def self.freesims_id
    simactive = Simnumlog.select(:sim_id).where("datestop  > current_timestamp ")
    sa_id=Array.new
    simactive.find_each do |d|
      sa_id=sa_id+[d.sim_id]
    end
    simall = Sim.select(:id)
    sl_id=Array.new
    simall.find_each do |d|
      sl_id = sl_id+[d.id]
    end
    sl_id - sa_id
  end

  def isfree?
    self.simnumlog.where("datestop > current_timestamp").last.nil?
    #(Simnumlog.where("datestop > current_timestamp").find(self.id) rescue true)  == true ? true : false

  end

  def self.notusesim_id
    simactive = Simlog.select(:sim_id).where("datestop  > current_timestamp ")
    #if simactive.last.nil? == false 
    sa_id=Array.new
    simactive.find_each do |d|
      sa_id=sa_id+[d.sim_id]
    end
    simall = Sim.select(:id)
    sl_id=Array.new
    simall.find_each do |d|
      sl_id = sl_id+[d.id]
    end
    sl_id - sa_id
  end

  def currentvoicenumber
    a = self.simnumlog.where("datestop > current_timestamp").last
    a.nil? ? nil : a.tnumber.voicenumber
  end

  def sirealnumber_with_currentvicenumber
    self.currentvoicenumber.to_s  + " " + self.sirealnumber.to_s
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
      n = Sim.where(:sirealnumber => row[0]).first || Sim.new(:sirealnumber => row[0])
      n.save
    end
  end




end
