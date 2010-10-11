require File.dirname(__FILE__) + "/../spec_helper"

module Tcsh2Bash
  describe PreParser do

    def parse(input)
      @parser.parse(input, Dir.pwd)
    end

    before :each do
      @parser = PreParser.new
    end

    describe 'removing extra spacing' do
      it "should remove any spaces at the start of the string" do
        parse("  foo").should == "foo"
      end

      it "should remove any spaces at the end of the string" do
        parse("foo  ").should == "foo"
      end

      it "should remove any carriage returns" do
        parse("foo\rbar\r\r").should == "foobar"
      end

      it "should remove a new line from the end" do
        parse("foo\nbar\n").should == "foo\nbar"
      end

      it "should collapse multiple new lines" do
        parse("foo\n\nbar\n").should == "foo\nbar"
      end

=begin
      it "should collapse remove extraneous spaces at the end of a line" do
        parse("foo     \nbar").should == "foo\nbar"
      end

      it "should collapse remove extraneous spaces at the beginning of a line" do
        parse("foo\n   bar").should == "foo\nbar"
      end
=end
    end

    # @todo - This test only works when invoked inside this directory.
    describe 'sourcing other files' do
      it "should recurively source other files" do
        input = <<EOF
source ../sample_data/foo
EOF

        output = <<EOF.strip
echo "Foo"
echo "Bar"
echo "Baz"
EOF

        parse(input).should == output
      end
    end

  end
end
