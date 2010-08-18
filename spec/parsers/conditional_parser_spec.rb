require 'spec_helper'

module Tcsh2Bash
  describe ConditionalParser do
    before :each do
      @parser = ConditionalParser.new
    end

    describe "one line if statement" do
      it "should parse this one line if statement" do
        parse("if (boolean) alias fire water").should_not be_nil
      end

      it "should convert it a one line if statement to bash" do

        output = <<EOF
if [ boolean ]
then
  echo "Hello world!"
fi
EOF
        output.strip!

        convert_to_bash('if (boolean) echo "Hello world!"').should == output
      end

      it "should convert assignments when possible" do
        output = <<EOF
if [ boolean ]
then
  alias foo=bar
fi
EOF
        output.strip!

        convert_to_bash('if (boolean) alias foo bar').should == output
      end
    end

  end
end
