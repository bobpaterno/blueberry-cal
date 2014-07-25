class Year
  attr_accessor :year
  def initialize(year)
    unless (1800..3000).include? year
      raise ArgumentError, "cal: year #{year} not in range 1800...3000"
    end
    @year = year
  end


  def leapyear?
    if @year % 4 == 0
      return true unless @year % 100 == 0
      return true if @year % 400 == 0
    end
    return false
  end

end
