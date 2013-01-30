class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :sname
      t.string :fname
      t.string :mname

      t.timestamps
    end
  end
end
