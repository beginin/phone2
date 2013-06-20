class CreateLoadcalls < ActiveRecord::Migration
  def change
    create_table :loadcalls do |t|
      t.datetime :date
      t.string :admin

      t.timestamps
    end
  end
end
