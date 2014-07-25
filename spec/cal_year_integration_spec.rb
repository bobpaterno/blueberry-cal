RSpec.describe "Cal's full year integration" do
  it "should correctly print 2017" do
    expected =<<EOS
EOS
    # exec: Executes the command on the command line
    actual = `./cal 2017`
    actual.should == expected
  end



end
