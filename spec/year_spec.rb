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


end
