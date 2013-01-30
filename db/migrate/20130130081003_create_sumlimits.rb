class CreateSumlimits < ActiveRecord::Migration
  def change
    create_table :sumlimits do |t|
      t.string :namelimit
      t.decimal :money

      t.timestamps
    end
  end
end
