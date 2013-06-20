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




end
