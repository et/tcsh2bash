require 'spec_helper'

module Tcsh2Bash
  describe ConditionalParser do
    before :each do
      @parser = ConditionalParser.new
    end

    describe "one line if statement" do
      it "should convert it a one line if statement to bash" do

        output = <<EOF
if [ $foo == "foo" ]
then
  echo "Hello world!"
fi
EOF
        output.strip!

        convert_to_bash('if ($foo == "foo") echo "Hello world!"').should == output
      end

      it "should convert assignments when possible" do
        output = <<EOF
if [ $foo -gt 2 ]
then
  alias foo=bar
fi
EOF
        output.strip!

        convert_to_bash('if ($foo > 2) alias foo bar').should == output
      end
    end

  end
end
