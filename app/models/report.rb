class Report < ActiveRecord::Base
	#attr_accessible :tnumber, :user_id, :sum
	belongs_to :user
	def self.columns
    @columns ||= []
  	end
 
  	def self.column(name, sql_type = nil, default = nil, null = true)
    	columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
 	end

 	def self.report1(id = "1")
 		sql = "SELECT calllogs.tnumber, SUM(calllogs.coast), simlogs.user_id
			FROM calllogs 
			LEFT JOIN tnumbers ON (calllogs.tnumber = tnumbers.voicenumber)
			LEFT JOIN simnumlogs ON (tnumbers.id = simnumlogs.tnumber_id AND calllogs.date >= simnumlogs.datestart AND calllogs.date < simnumlogs.datestop)
			LEFT JOIN simlogs ON (simnumlogs.sim_id = simlogs.sim_id AND calllogs.date >= simlogs.datestart AND calllogs.date < simlogs.datestop)
			LEFT JOIN userlogs ON (simlogs.user_id = userlogs.user_id AND calllogs.date >= userlogs.datestart AND calllogs.date < userlogs.datestop)
			WHERE calllogs.load_id =  " + id + "
			GROUP BY    simlogs.user_id ,calllogs.tnumber"

		sql = "WITH fin as(
			SELECT calllogs.tnumber, SUM(calllogs.coast), simlogs.user_id
			FROM calllogs 
			LEFT JOIN tnumbers ON (calllogs.tnumber = tnumbers.voicenumber)
			LEFT JOIN simnumlogs ON (tnumbers.id = simnumlogs.tnumber_id AND calllogs.date >= simnumlogs.datestart AND calllogs.date < simnumlogs.datestop)
			LEFT JOIN simlogs ON (simnumlogs.sim_id = simlogs.sim_id AND calllogs.date >= simlogs.datestart AND calllogs.date < simlogs.datestop)
			LEFT JOIN userlogs ON (simlogs.user_id = userlogs.user_id AND calllogs.date >= userlogs.datestart AND calllogs.date < userlogs.datestop)
			LEFT JOIN schedules ON (userlogs.schedule_id = schedules.id)
			WHERE 
			((calllogs.descriptioncall_id  IN (SELECT id FROM descriptioncalls WHERE fin = 'true'))
			or date_trunc( 'day',calllogs.date)  IN (SELECT date FROM holidays)
			or \"time\"(calllogs.date) < schedules.timein
			or \"time\"(calllogs.date) > schedules.timeout)
			AND calllogs.load_id =  " + id + "
			GROUP BY    simlogs.user_id ,calllogs.tnumber),
			upr as (
			SELECT calllogs.tnumber, SUM(calllogs.coast), simlogs.user_id
			FROM calllogs
			LEFT JOIN tnumbers ON (calllogs.tnumber = tnumbers.voicenumber)
			LEFT JOIN simnumlogs ON (tnumbers.id = simnumlogs.tnumber_id AND calllogs.date >= simnumlogs.datestart AND calllogs.date < simnumlogs.datestop)
			LEFT JOIN simlogs ON (simnumlogs.sim_id = simlogs.sim_id AND calllogs.date >= simlogs.datestart AND calllogs.date < simlogs.datestop)
			LEFT JOIN userlogs ON (simlogs.user_id = userlogs.user_id AND calllogs.date >= userlogs.datestart AND calllogs.date < userlogs.datestop)
			WHERE calllogs.load_id =  " + id + "
			GROUP BY  simlogs.user_id ,calllogs.tnumber
			)

			Select upr.tnumber, upr.user_id, upr.sum * 1.18 as totalsum , fin.sum * 1.18 as finsum 
			From upr
			LEFT JOIN fin  ON (upr.user_id=fin.user_id AND upr.tnumber=fin.tnumber)
			ORDER BY upr.tnumber"

		self.find_by_sql(sql)
		mass = ActiveRecord::Base.connection.select_all( sql )

 	end

 	def self.rep(id = "1")
 		sql = "WITH simnumlogs_full AS (
			SELECT * FROM simnumlogs
			LEFT JOIN simperiods ON  (simnumlogs.simperiod_id = simperiods.id)
			),
			userlogs_full AS ( 
			SELECT userlogs.id as userlogid ,userlogs.*, users.*, cfus.namecfu, sumlimits.money, userperiods.datein,  userperiods.dateout, schedules.*
			FROM userlogs
			LEFT JOIN users ON (userlogs.user_id = users.id)
			LEFT JOIN cfus ON (userlogs.cfu_id = cfus.id)
			LEFT JOIN sumlimits ON (userlogs.sumlimit_id = sumlimits.id)
			LEFT JOIN userperiods ON (userperiods.id = userlogs.userperiod_id)
			LEFT JOIN schedules ON (schedules.id = userlogs.schedule_id)
			),
			tnumbers_full AS (
			SELECT tnumbers.* , tarifs.name as tarifname
			from tnumbers 
			LEFT JOIN tarifs  ON (tnumbers.tarif_id = tarifs.id)
			),
			upr AS (
			SELECT date_trunc( 'month',colllogs.date) as date_month, colllogs.tnumber,tnumbers_full.tarifname , tnumbers_full.id as tnumberid ,userlogs_full.userlogid ,SUM(colllogs.coast),userlogs_full.user_id as upruserid
			FROM colllogs 
			LEFT JOIN tnumbers_full ON (colllogs.tnumber = tnumbers_full.voicenumber)
			LEFT JOIN simnumlogs_full ON (tnumbers_full.id = simnumlogs_full.tnumber_id AND colllogs.date >= simnumlogs_full.datein AND 
(colllogs.date <= simnumlogs_full.dateout OR simnumlogs_full.dateout IS NULL) )
			LEFT JOIN userlogs_full ON (simnumlogs_full.sim_id = userlogs_full.sim_id AND colllogs.date >= userlogs_full.datein AND 
			(colllogs.date <= userlogs_full.dateout OR userlogs_full.dateout IS NULL) )
			WHERE colllogs.load_id =  " + id + "
			GROUP BY date_month, colllogs.tnumber,tnumbers_full.tarifname ,tnumberid , userlogid ,upruserid
			),


			fin AS (
			SELECT date_trunc( 'month',colllogs.date) as date_month_fin, colllogs.tnumber, tnumbers_full.id,userlogs_full.user_id,SUM(colllogs.coast) as fsum
			FROM colllogs 
			LEFT JOIN tnumbers_full ON (colllogs.tnumber = tnumbers_full.voicenumber)
			LEFT JOIN simnumlogs_full ON (tnumbers_full.id = simnumlogs_full.tnumber_id AND colllogs.date >= simnumlogs_full.datein AND 
			(colllogs.date <= simnumlogs_full.dateout OR simnumlogs_full.dateout IS NULL) )
			LEFT JOIN userlogs_full ON (simnumlogs_full.sim_id = userlogs_full.sim_id AND colllogs.date >= userlogs_full.datein AND 
			(colllogs.date <= userlogs_full.dateout OR userlogs_full.dateout IS NULL) )
			WHERE (colllogs.descriptioncall_id  IN (SELECT id FROM descriptioncalls WHERE fin = 'true')
			or date_trunc( 'day',colllogs.date)  IN (SELECT hollyday FROM hollydays)
			or \"time\"(colllogs.date) < userlogs_full.timein
			or \"time\"(colllogs.date) > userlogs_full.timeout)
			AND colllogs.load_id =  " + id + "
			GROUP BY date_month_fin, colllogs.tnumber ,tnumbers_full.id , userlogs_full.user_id
			)


			SELECT upr.userlogid, date_month ,upr.tnumber,upr.tarifname , upr.sum * 1.18 as totalsum,upr.sum * 1.18 - userlogs_full.money as uprsum, 
			fin.fsum * 1.18 as finsum   , userlogs_full.secondname,userlogs_full.firstname,userlogs_full.midlename,
			userlogs_full.namecfu,userlogs_full.money,userlogs_full.datein,userlogs_full.dateout,userlogs_full.timein,
			userlogs_full.timeout
			FROM upr
			LEFT JOIN fin ON (fin.user_id = upr.upruserid AND upr.date_month = fin.date_month_fin )
			LEFT JOIN userlogs_full ON (upr.userlogid = userlogs_full.userlogid)
			"
		self.find_by_sql(sql)
		mass = ActiveRecord::Base.connection.select_all( sql )
		mass.each do |r|
			datein=Time.parse(r["date_month"]).beginning_of_month
			if r["datein"].present?
				if Time.parse(r["datein"]) > Time.parse(r["date_month"])
					datein = Time.parse(r["datein"]) 
				else 
					datein = Time.parse(r["date_month"])
				end
			end

			dateout=Time.parse(r["date_month"]).end_of_month
			if r["dateout"].present?
				if Time.parse(r["dateout"]).month == Time.parse(r["date_month"]).month
					dateout = Time.parse(r["dateout"]) 
				else 
					dateout = Time.parse(r["date_month"]).end_of_month
				end
			end
			if r["datein"].present?
				days = dateout.day - datein.day + 1
				days_in_month =Time.parse(r["date_month"]).end_of_month.day 		
				r["uprsum"] = r["totalsum"].to_d - (days.to_f/days_in_month)*r["money"].to_d
				r["uprsum"] = r["uprsum"].round 2

				#r["uprsum"] = ((days.to_f/days_in_month)*r["money"].to_d).to_s
			end
			r["totalsum"] = r["totalsum"].to_d.round 2 if r["totalsum"].present?
			r["finsum"] = r["finsum"].to_d.round 2 if r["finsum"].present?
		end
		mass
 	end
 
  	# Manually define the columns used by this model
  	column :tnumber, :integer
  	column :uprsum, :deciaml
  	column :finsum, :deciaml
  	column :secondname, :string
 	column :firstname, :string
 	column :midlename, :string
 	column :namecfu, :string
 	column :money, :deciaml
 	column :datein, :timestamp
 	column :dateout, :timestamp
 	column :timein, :time
 	column :timeout, :time
end