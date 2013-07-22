class CreateUser < ActiveRecord::Migration
  def up
    create_table :users do |t|
     t.string :name
     t.string :email
     t.string :password
     t.integer :is_arrive
     t.timestamps
    end

  end

  def down
  end
end
