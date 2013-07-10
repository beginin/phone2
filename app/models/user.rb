class User < ActiveRecord::Base
  attr_accessible :fname, :mname, :sname
  has_many :userlog
  has_many :simlog
  #accepts_nested_attributes_for :userlog
  validates :fname, :mname, :sname , :presence => true
  
  def fullname
  	self.sname.to_s + " " + self.fname.to_s + " " + self.mname.to_s 
  end


  #def userlog_attributes=(userlog_attributes)
  #	attributes=userlog_attributes.first.fetch(1)
  #	userlog.build(attributes)
  #end

  def owensims_id
    a=self.simlog.select(:sim_id).where("datestop  > current_timestamp ")  
    b=Array.new
    a.each do |d|
      b << d.sim_id
    end
    b
  end

  def owensims
    self.simlog.where("datestop  > current_timestamp ")
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
      if User.where(:sname => row[0].split(' ')[0],:fname => row[0].split(' ')[1],:mname => row[0].split(' ')[2] ).first.nil?
        n = User.create(:sname => row[0].split(' ')[0],:fname => row[0].split(' ')[1],:mname => row[0].split(' ')[2])
        nlog=n.userlog.new
        nlog.cfu_text = row[1]
        nlog.schedule = Schedule.first
        nlog.sumlimit = Sumlimit.first
        nlog.datestart = row[2].to_datetime
        nlog.datestop = Phone2::Application::config.timeinfinity
        nlog.save
      end
    end
  end

end

