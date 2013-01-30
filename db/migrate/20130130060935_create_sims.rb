class CreateSims < ActiveRecord::Migration
  def change
    create_table :sims do |t|
      t.string :sirealnumber

      t.timestamps
    end
  end
end
