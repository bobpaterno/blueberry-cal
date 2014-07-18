class ZellersCongruence
  def self.calculate(month,day,year)
    d = day
    m = month < 3 ? month+12 : month
    year = month < 3 ? year - 1 : year
    y = year % 100
    j = (year / 100).floor

    h = d + (13*(m+1)/5).floor + y + (y/4).floor + (j/4).floor + 5*j
    h % 7
    
  end
end
