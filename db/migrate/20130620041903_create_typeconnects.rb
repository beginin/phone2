class CreateTypeconnects < ActiveRecord::Migration
  def change
    create_table :typeconnects do |t|
      t.string :name

      t.timestamps
    end
  end
end
