require File.dirname(__FILE__) + "/../spec_helper"

module Tcsh2Bash
  describe TcshParser do
    before :each do
      @parser = TcshParser.new
    end

    describe 'one line' do
      specify { parse('set foo=bar').should_not be_nil }
    end

    describe 'two lines' do
      specify { parse("set foo=bar\nalias hello world").should_not be_nil }
    end

    describe 'bad line' do
      it 'it should parse this, but provide an error message' do
        output = <<EOF
foo=bar
#######################
# Unable to parse: FOO BAR
#######################
EOF
        convert_to_bash("set foo=bar\nFOO BAR").should == output
      end
    end

  end
end
