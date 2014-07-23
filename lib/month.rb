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

  def make_days_array
    @first_week_day = ZellersCongruence.calculate(@month,1,@year)
    @first_week_day = (@first_week_day + 6) % 7 # makes Sunday the zeroth index
    output = ""
    index = @first_week_day
    count = 1
    @first_week_day.times { output << "   " }
    @num_month_days.times do
      (index+1) % DAYS_IN_WEEK == 0 ? output << "#{count.to_s.rjust(2)}\n" : output << "#{count.to_s.rjust(2)} "
      index += 1
      count += 1
    end
    output = output.rstrip
    num_extra_newlines = 6 - (output.size/20).ceil
    num_extra_newlines.times do
      output << "\n"
    end
    output
  end

  def make_week(start_date, start_index)
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

  def create_month_array(week_num)
    @days_array = Array.new(6) { Array.new(8) }
    @first_week_day = ZellersCongruence.calculate(@month,1,@year)
    @first_week_day = (@first_week_day +6) % 7  # makes Sunday the zeroth index

    if week_num == 0
      @days_array[week_num].collect! { |day| day = "   " }
    end
  end

  def to_s
    make_days_array
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    output << make_days_array
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

  def week_format
    line = ""
    arr = [8,9,10,11,12,13,14]
    arr.each { |num| line << sprintf("%2d ", num) }
    line =line.rstrip << "\n"
  end
end
