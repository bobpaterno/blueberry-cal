require_relative '../lib/zellers_congruence'

RSpec.describe ZellersCongruence do
  context ".calculate" do
    it "returns 3 (which is Tuesday's index) as July 15, 2014" do
      month = 7
      day = 15
      year = 2014
      ZellersCongruence.calculate(month,day,year).should == 3
    end
    it "returns 0 (which is Saturday's index) as Feb 4, 1950" do
      month = 2
      day = 4
      year = 1950
      ZellersCongruence.calculate(month,day,year).should == 0
    end
  end
end

