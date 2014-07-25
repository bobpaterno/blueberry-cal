
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


  def make_months_array
    months = []
    NUM_ROWS.times.with_index do |i|
      m1 = Month.new((i*3)+1,@year).to_s.split("\n")
      m2 = Month.new((i*3)+2,@year).to_s.split("\n")
      m3 = Month.new((i*3)+3,@year).to_s.split("\n")
      m1.collect! { |m| m.ljust(MONTH_WIDTH) }
      m2.collect! { |m| m.ljust(MONTH_WIDTH) }
      m3.collect! { |m| m.ljust(MONTH_WIDTH) }

      months << m1[1..m1.size].zip(m2[1..m1.size],m3[1..m1.size])
    end
    months.flatten.flatten
  end


  def to_s
    # make_months
    output = ""
    output << header
    # months_array = @months.collect { |month| month.split("\n") }

    # @months.each_slice(NUM_COLUMNS) do |row|
    #   row.each { |month| output << (month.name.center(20) << "  ")}
    #   output << (output.rstrip << "\n")
    # end
    months=make_months_array
    months.each_slice(3) do |line|
      output << line.join("  ")
      output << "\n"
    end
    output
  end

end
