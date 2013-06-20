class CreateCalllogs < ActiveRecord::Migration
  def change
    create_table :calllogs do |t|
      t.column :tnumber, 'BIGINT'
      t.integer :load_id
      t.datetime :date
      t.time :duration
      t.decimal :coast ,:precision => 15, :scale => 4
      t.column  :tnumber_out, 'BIGINT'
      t.column  :tnumber_in, 'BIGINT'
      t.integer :typecall_id
      t.integer :descriptioncall_id
      t.integer :typeconnect_id
      t.integer :base
      t.decimal :valuemb ,:precision => 15, :scale => 4

      t.timestamps
    end
  end
end
