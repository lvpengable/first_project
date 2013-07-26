class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :user_id
      t.datetime :checkin_time

      t.timestamps
    end
  end
end
