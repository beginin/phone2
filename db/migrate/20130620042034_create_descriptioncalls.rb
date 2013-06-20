class CreateDescriptioncalls < ActiveRecord::Migration
  def change
    create_table :descriptioncalls do |t|
      t.string :name
      t.boolean :fin

      t.timestamps
    end
  end
end
