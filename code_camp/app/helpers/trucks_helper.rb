require 'date'

module TrucksHelper
  # given some integer day, return a string day
  def weekday(day)
    Date::DAYNAMES[day] # Sunday...
  end

  # take a integer hour 0-23 and turn it into something 3:00PM
  def pretty_time(hour)
    if hour == 0
      '12:00AM'
    elsif hour == 12
      '12:00PM'
    elsif hour > 12
      "#{hour-12}:00PM"
    else
      "#{hour}:00AM"
    end
  end
end
