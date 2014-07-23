class Month
  require 'zellers_congruence'

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

  def make_week(start_date, start_index)
    # Returns an array of strings representing a week
    # start_date is the number of the first day in the week
    # start_index is which day of the week to start, 0 is Sunday
    week = []
    start_index.times { week << "  " }

    (DAYS_IN_WEEK - start_index).times do
      week << start_date.to_s.rjust(2) unless start_date > @num_month_days
      start_date += 1
    end
    week << "\n"
  end

  def make_month
    day_date = 1
    start_index = @first_week_day
    month = []
    WEEKS_TO_PRINT.times do
      month << make_week(day_date, start_index)
      day_date += (DAYS_IN_WEEK - start_index)
      start_index = 0
    end
    month
  end

  def to_s
    month = make_month
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    month.each do |week|
      weekdays = week.first(week.length-1).join(" ")
      output << weekdays << "\n"
    end
    output
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

end
