RSpec.describe "Cal's full month integration" do
  it "should correctly print July 2017" do
    expected =<<EOS
     July 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    # exec: Executes the command on the command line
    actual = `./cal 07 2012`
    actual.should == expected
  end

  it "should correctly print December 2013" do
    expected =<<EOS
   December 2013
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    actual = `./cal 12 2013`
    actual.should == expected
  end

it "should correctly print February 1800" do
  expected =<<EOS
   February 1800
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28

EOS
    actual = `./cal 2 1800`
    actual.should == expected
  end


it "should correctly print June 2999" do
  expected =<<EOS
     June 2999
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30
EOS
    actual = `./cal 6 2999`
    actual.should == expected
  end

it "should correctly print February 2000" do
  expected =<<EOS
   February 2000
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29

EOS
    actual = `./cal 2 2000`
    actual.should == expected
  end


it "should correctly print February 1998" do
  expected =<<EOS
   February 1998
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28


EOS
    actual = `./cal 2 1998`
    actual.should == expected
  end



end
