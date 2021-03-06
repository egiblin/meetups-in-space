class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :location, null: false
      table.string :time, null: false
      table.string :name, null: false
      table.string :duration, null: false
      table.string :description, null: false

      table.timestamps null: false
    end
  end
end
