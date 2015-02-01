# Get the integer hour given a hour formatted like 2PM
def parse_date(date)
  match_data = date.match(/^(\d{1,2})(AM|PM)/)
  date = match_data[1].to_i
  if match_data[2] == 'PM'
    date += 12
  end
  date % 24
end

# Create a task with name load_trucks, initialize the rails environment (access models, classes, etc)
# Load in each row of our CSV into our database
task load_trucks: :environment do
  require 'csv'
  CSV.foreach Rails.root.join('data.csv') do |row|
    next if row[0] == 'DayOrder'
    name = row[18]
    unless t = Truck.find_by_name(name)
      t = Truck.create!(name: name, description: row[7])
    end

    t.locations.create!(day_of_week: row[0], start_hour: parse_date(row[2]), end_hour: parse_date(row[3]), lat: row[21], long: row[22])
  end
end