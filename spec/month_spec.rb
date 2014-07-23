require_relative '../lib/month'

RSpec.describe Month do
  context ".header" do
    it "matches cal for December 2012" do
      month = Month.new(12,2012)
      month.header.should == "   December 2012"
    end

    it "matches cal for July 1901" do
      month = Month.new(7,1901)
      month.header.should == "     July 1901"
    end
  end

  context "Checks valid inputs" do
    it "raises an exception for an invalid month" do
      expect { Month.new(13,2000) }.to raise_error
    end
    it "raises an ArgumentError for an invalid year" do
      expect { Month.new(12,1000) }.to raise_error(ArgumentError)
    end
    it "raises an ArgumentError and message for an invalid year" do
      expect { Month.new(15,2001) }.to raise_error(ArgumentError, "Invalid arguments.  Usage: cal [month] year")
    end
  end

  context ".name" do
    it "translates January" do
      Month.new(1,2012).name.should == "January"
    end
    it "translates February" do
      Month.new(2,2012).name.should == "February"
    end
    it "translates March" do
      Month.new(3,2012).name.should == "March"
    end
    it "translates April" do
      Month.new(4,2012).name.should == "April"
    end
    it "translates May" do
      Month.new(5,2012).name.should == "May"
    end
    it "translates June" do
      Month.new(6,2012).name.should == "June"
    end
    it "translates July" do
      Month.new(7,2012).name.should == "July"
    end
    it "translates August" do
      Month.new(8,2012).name.should == "August"
    end
    it "translates September" do
      Month.new(9,2012).name.should == "September"
    end
    it "translates January" do
      Month.new(10,2012).name.should == "October"
    end
    it "translates January" do
      Month.new(11,2012).name.should == "November"
    end
    it "translates January" do
      Month.new(12,2012).name.should == "December"
    end
  end

  context "determine if leap year" do
    it "returns true for 2004" do
      Month.new(1,2004).leap_year?.should == true
    end
    it "returns true for 1816" do
      Month.new(1,1816).leap_year?.should == true
    end
    it "returns true for 2000" do
      Month.new(1,2000).leap_year?.should == true
    end
    it "returns false for 1900" do
      Month.new(1,1900).leap_year?.should == false
    end
  end

  context "31 day long months" do
    it "returns 31 days for January" do
      Month.new(1,2015).month_days.should == 31
    end
    it "returns 31 days for March" do
      Month.new(3,2012).month_days.should == 31
    end
    it "returns 31 days for May" do
      Month.new(5,2812).month_days.should == 31
    end
    it "returns 31 days for July" do
      Month.new(7,1801).month_days.should == 31
    end
    it "returns 31 days for August" do
      Month.new(5,2800).month_days.should == 31
    end
    it "returns 31 days for October" do
      Month.new(10,1812).month_days.should == 31
    end
    it "returns 31 days for December" do
      Month.new(12,1925).month_days.should == 31
    end
  end

  context "30 day long months" do
    it "returns 30 days for April" do
      Month.new(4,1904).month_days.should == 30
    end
    it "returns 30 days for June" do
      Month.new(6,1970).month_days.should == 30
    end
    it "returns 30 days for September" do
      Month.new(9,1930).month_days.should == 30
    end
    it "returns 30 days for November" do
      Month.new(11,1970).month_days.should == 30
    end
  end

  context "month num days in February" do
    it "returns 29 days for February" do
      Month.new(2,1904).month_days.should == 29
    end
    it "returns 28 days for February" do
      Month.new(2,1903).month_days.should == 28
    end
    it "returns 28 days for February" do
      Month.new(2,1900).month_days.should == 28
    end
  end

  context ".week_format" do
    it "outputs a week array [1,2,3,4,5,6,7,\\n]" do
      month = Month.new(3,2015)
      expected = [" 1", " 2", " 3", " 4", " 5", " 6", " 7", "\n"]
      month.make_week(1,0).should == expected
    end
    it "outputs a week array ["  ",1,2,3,4,5,6,\\n]" do
      month = Month.new(9,2014)
      expected = ["  ", " 1", " 2", " 3", " 4", " 5", " 6", "\n"]
      month.make_week(1,1).should == expected
    end
    it "outputs a week array ["  ","  ",1,2,3,4,5,\\n]" do
      month = Month.new(7,2014)
      expected = ["  ", "  ", " 1", " 2", " 3", " 4", " 5", "\n"]
      month.make_week(1,2).should == expected
    end
    it "outputs a week array ["  ","  ","  ","  ","  ","  ",1,\\n]" do
      month = Month.new(11,2014)
      expected = ["  ", "  ", "  ", "  ", "  ", "  ", " 1", "\n"]
      month.make_week(1,6).should == expected
    end
    it "outputs a week array [2,3,4,5,6,7,8,\\n]" do
      month = Month.new(3,2014)
      expected = [" 2", " 3", " 4", " 5", " 6", " 7"," 8", "\n"]
      month.make_week(2,0).should == expected
    end
    it "outputs a week array [8,9,10,11,12,13,14,\\n]" do
      month = Month.new(3,2014)
      expected = [" 8", " 9", "10", "11", "12", "13","14", "\n"]
      month.make_week(8,0).should == expected
    end
    it "outputs a week array [25,26,27,28,29,30,31,\\n]" do
      month = Month.new(3,2014)
      expected = ["25", "26", "27", "28", "29", "30","31", "\n"]
      month.make_week(25,0).should == expected
    end
    it "outputs a week array [25,26,27,28,29,30,\\n]" do
      month = Month.new(4,2014)
      expected = ["25", "26", "27", "28", "29", "30", "\n"]
      month.make_week(25,0).should == expected
    end
    it "outputs a week array [31,\\n]" do
      month = Month.new(3,2014)
      expected = ["31", "\n"]
      month.make_week(31,0).should == expected
    end
    it "outputs a week array [\\n]" do
      month = Month.new(3,2014)
      expected = ["\n"]
      month.make_week(32,0).should == expected
    end
  end

  context ".week_format" do
    it "makes the array for the month, March 2015" do
      month = Month.new(3,2015)
      expected = [[" 1", " 2", " 3", " 4", " 5", " 6", " 7", "\n"],
                  [" 8"," 9","10","11","12","13","14","\n"],
                  ["15","16","17","18","19","20","21","\n"],
                  ["22","23","24","25","26","27","28","\n"],
                  ["29","30","31","\n"],
                  ["\n"]]
      month.make_month.should == expected
    end

    it "prints out the month March 2015" do
      month = Month.new(3,2015)
      expected = "     March 2015\nSu Mo Tu We Th Fr Sa\n 1  2  3  4  5  6  7\n 8  9 10 11 12 13 14\n15 16 17 18 19 20 21\n22 23 24 25 26 27 28\n29 30 31\n\n"
      month.to_s.should == expected
    end
    it "prints out the month January 1900" do
      month = Month.new(1,1900)
      expected=<<EOS
    January 1900
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31

EOS
      month.to_s.should == expected
    end
  end

end
