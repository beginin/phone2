class CreateCfus < ActiveRecord::Migration
  def change
    create_table :cfus do |t|
      t.string :namecfu

      t.timestamps
    end
  end
end
