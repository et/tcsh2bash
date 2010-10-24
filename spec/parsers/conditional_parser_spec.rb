require 'spec_helper'

module Tcsh2Bash
  describe ConditionalParser do
    before :each do
      @parser = TcshParser.new
    end

    describe "one line if statement" do
      it "should convert it a one line if statement to bash" do

output = <<IF_ONE_LINE.strip
if [ $foo == "foo" ] ; then echo "Hello world!" ; fi
IF_ONE_LINE

        convert_to_bash('if ($foo == "foo") echo "Hello world!"').should == output
      end

      it "should convert assignments when possible" do

output = <<IF_ONE_LINE.strip
if [ $foo -gt 2 ] ; then alias foo=bar ; fi
IF_ONE_LINE

        convert_to_bash('if ($foo > 2) alias foo bar').should == output
      end
    end

    describe "multi-line if statement" do
      it "should convert a multi-line statement to bash" do

      input = <<INPUT.strip
if ($foo == 'foo') then
  echo 'Hello world!'
endif
INPUT

output = <<OUTPUT.strip
if [ $foo == 'foo' ]
then
  echo 'Hello world!'
fi
OUTPUT
        convert_to_bash(input).should == output
      end

      it "should convert a multi-line statement with multiple statements" do

input = <<INPUT.strip
if ($foo == 'foo') then
  echo 'Hello world!'
  echo "Goodbye world!"
endif
INPUT

output = <<OUTPUT.strip
if [ $foo == 'foo' ]
then
  echo 'Hello world!'
  echo "Goodbye world!"
fi
OUTPUT
        convert_to_bash(input).should == output

      end
    end
  end
end
