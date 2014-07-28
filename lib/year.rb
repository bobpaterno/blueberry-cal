
class Year
  attr_accessor :year
  LINE_WIDTH = 64
  NUM_MONTHS = 12
  NUM_COLUMNS= 3
  NUM_ROWS   = 4
  MONTH_WIDTH= 20

  def initialize(year)
    unless (1800..3000).include? year.to_i
      raise ArgumentError, "cal: year #{year} not in range 1800...3000"
    end
    @year = year.to_i
    @months = []
  end

  def leapyear?
    if @year % 4 == 0
      return true unless @year % 100 == 0
      return true if @year % 400 == 0
    end
    return false
  end

  def header
    "#{@year}".center(LINE_WIDTH-1).rstrip << "\n\n"
  end

  def make_months
    NUM_MONTHS.times do |month|
      @months << Month.new(month+1, @year)
    end
  end

  def months(n)
    @months[n-1]
  end

  def month_headers_string(start_month)
    month_header = ""
    start_month -= 1
    NUM_COLUMNS.times do |i|
      month_header << (@months[start_month+i].name.center(20) << "  ")
    end
    month_header.rstrip << "\n"
  end

  def weekday_headers_string
    week_header=""
    weekday_header = @months[0].to_s.split("\n")[1].rstrip
    NUM_COLUMNS.times do |i|
      week_header << weekday_header << "  "
    end
    week_header.rstrip << "\n"
  end

  def to_s
    output = ""
    header_index = 1
    make_months
    output << header
    @months.each_slice(NUM_COLUMNS) do |row|
      output << month_headers_string(header_index)
      output << weekday_headers_string
      header_index += NUM_COLUMNS

      mo1 = row[0].to_s.lines("\n").collect! { |l| l.sub(/\n/,"") }[2..7]
      mo2 = row[1].to_s.lines("\n").collect! { |l| l.sub(/\n/,"") }[2..7]
      mo3 = row[2].to_s.lines("\n").collect! { |l| l.sub(/\n/,"") }[2..7]

      month_row = mo1.zip(mo2,mo3).flatten
      month_row.each_slice(NUM_COLUMNS) do |line|
        this_row = ""
        padding = "".ljust(MONTH_WIDTH+2)
        this_row << (line[0].empty? ? padding : (line[0].ljust(MONTH_WIDTH) << "  ") )
        this_row << (line[1].empty? ? padding : (line[1].ljust(MONTH_WIDTH) << "  ") )
        this_row << line[2].ljust(MONTH_WIDTH)
        output << (this_row.rstrip << "\n")
      end
    end
    output
  end
end
