class Month
  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  def initialize(month, year)
    err_msg = "Invalid arguments.  Usage: cal [month] year"
    raise ArgumentError, err_msg if month < 1 || month > 12
    raise ArgumentError, err_msg if year < 1800 || year > 3000
    @month = month
    @year = year
    @num_month_days = month_days
  end

  def header
    "#{name} #{@year}".center(20).rstrip
  end

  def name
    MONTHS[@month]
  end

  def to_s
    days = Array(1..month_days)
    puts days
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
  end

  def leap_year?
    if @year % 4 == 0
      return true unless @year % 100 == 0
      return true if @year % 400 == 0
      return false
    end
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
