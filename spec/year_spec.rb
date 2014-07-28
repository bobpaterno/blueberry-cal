require_relative '../lib/month'
require_relative '../lib/year'

RSpec.describe Year do
  context "leapyear?" do
    it "returns true for 2000 leapyear?" do
      year = Year.new(2000)
      year.leapyear?.should == true
    end
    it "returns true for 2004 leapyear?" do
      year = Year.new(2004)
      year.leapyear?.should == true
    end
    it "returns false for 1902 leapyear?" do
      year = Year.new(1902)
      year.leapyear?.should == false
    end
    it "returns false for 2000 leapyear?" do
      year = Year.new(2100)
      year.leapyear?.should == false
    end
    it "returns true for 2400 leapyear?" do
      year = Year.new(2400)
      year.leapyear?.should == true
    end
  end

  context "catches invalid year" do
    it "prints error message about invalid range" do
      expected = "cal: year 1000 not in range 1800...3000\n"
      actual = `./cal 1000`
      actual.should == expected
    end
    it "prints error message about invalid range" do
      expected = "cal: year 3002 not in range 1800...3000\n"
      actual = `./cal 3002`
      actual.should == expected
    end

  end

  context "Year#header method" do
    it "prints out header year with appropriate width" do
      expected = "                             2017\n\n"
      year = Year.new(2017)
      actual = year.header
      actual.should == expected
    end
    it "prints out header year with appropriate width" do
      expected = "                             1812\n\n"
      year = Year.new(1812)
      actual = year.header
      actual.should == expected
    end
    it "prints out header year with appropriate width" do
      expected = "                             1908\n\n"
      year = Year.new(1908)
      actual = year.header
      actual.should == expected
    end
  end

  context "Year#make_months method" do
    it "checks that Year@months array is created" do
      year = Year.new(2001)
      expected =<<EOS
   February 2001
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28

EOS
      year.make_months
      actual = year.months(2).to_s
      actual.should == expected
    end
  end

  context "#month_headers_string starting January" do
    it "checks if the 3 month headers are output correctly" do
      year = Year.new(2000)
      year.make_months
      expected = "      January               February               March\n"
      actual = year.month_headers_string(1)
      actual.should == expected
    end
    it "checks if the 3 month headers are output correctly" do
      year = Year.new(1970)
      year.make_months
      expected = "       April                  May                   June\n"
      actual = year.month_headers_string(4)
      actual.should == expected
    end
    it "checks if the 3 month headers are output correctly" do
      year = Year.new(2000)
      year.make_months
      expected = "        July                 August              September\n"
      actual = year.month_headers_string(7)
      actual.should == expected
    end
    it "checks if the 3 month headers are output correctly" do
      year = Year.new(2001)
      year.make_months
      expected = "      October               November              December\n"
      actual = year.month_headers_string(10)
      actual.should == expected
    end
  end

  context "#weekday_headers_string" do
    it "check if week day headers print out correctly" do
      year = Year.new(1902)
      year.make_months
      expected = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
      actual = year.weekday_headers_string
      actual.should == expected
    end
  end



end
