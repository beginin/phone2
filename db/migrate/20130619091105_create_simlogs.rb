class CreateSimlogs < ActiveRecord::Migration
  def change
    create_table :simlogs do |t|
      t.integer :sim_id
      t.integer :user_id
      t.integer :type
      t.datetime :datestart
      t.datetime :datestop

      t.timestamps
    end
  end
end
