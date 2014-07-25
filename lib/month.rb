require_relative '../lib/zellers_congruence'

class Month

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  DAYS_IN_WEEK = 7
  WEEKS_TO_PRINT = 6

  def initialize(month, year)
    err_msg = "Invalid arguments.  Usage: cal [month] year"
    raise ArgumentError, err_msg if month < 1 || month > 12
    raise ArgumentError, err_msg if year < 1800 || year > 3000
    @month = month
    @year = year
    @num_month_days = month_days
    @first_week_day = ZellersCongruence.calculate(@month,1,@year)
    @first_week_day = (@first_week_day + 6) % 7 # makes Sunday the zeroth index
  end

  def header
    "#{name} #{@year}".center(20).rstrip
  end

  def name
    MONTHS[@month]
  end


  def leap_year?
    if @year % 4 == 0
      return true unless @year % 100 == 0
      return true if @year % 400 == 0
    end
    return false
  end

  def month_days
    if @month == 2
      return 28 unless leap_year?
      return 29
    end
    return 30 + (@month + (@month/8.0).floor) % 2
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    days = Array(1..@num_month_days)
    @first_week_day.times { days.unshift("  ") }
    week_count = 0
    days.each_slice(DAYS_IN_WEEK) do |week|
      week_count += 1
      week.collect! { |day| day.to_s.rjust(2) }
      output << (week.join(" ") << "\n")
    end
    (WEEKS_TO_PRINT - week_count).times { output << "\n" }
    output
  end

end
