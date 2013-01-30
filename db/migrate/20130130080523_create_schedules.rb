class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.time :timein
      t.time :timeout

      t.timestamps
    end
  end
end
