class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      # truck_id
      t.belongs_to :truck, null: false # t.integer :truck_id
      t.float :lat, :long, null: false
      t.integer :day_of_week, :start_hour, :end_hour, null: false
      t.timestamps null: false
    end
  end

  # def up
  # def down
end
