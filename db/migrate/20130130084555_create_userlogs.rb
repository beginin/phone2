class CreateUserlogs < ActiveRecord::Migration
  def change
    create_table :userlogs do |t|
      t.integer :user_id
      t.integer :cfu_id
      t.integer :schedule_id
      t.integer :sumlimit_id
      t.datetime :datestart
      t.datetime :datestop

      t.timestamps
    end
  end
end
