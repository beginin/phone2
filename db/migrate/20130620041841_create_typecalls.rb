class CreateTypecalls < ActiveRecord::Migration
  def change
    create_table :typecalls do |t|
      t.string :name

      t.timestamps
    end
  end
end
