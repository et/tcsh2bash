require 'spec_helper'

module Tcsh2Bash
  describe AliasParser do
    before :each do
      @parser = AliasParser.new
    end

    it 'should convert a regular alias expression' do
      convert_to_bash("alias foo bar").should == "alias foo=bar"
    end

    it 'should convert an alias expression with single quotes' do
      convert_to_bash("alias foo 'bar'").should == "alias foo='bar'"
    end

    it 'should convert an alias expression with double quotes' do
      convert_to_bash('alias foo "bar"').should == 'alias foo="bar"'
    end

    it 'should convert an alias expression with a path' do
      convert_to_bash("alias foo /bar/baz/buzz").should == 'alias foo=/bar/baz/buzz'
    end
  end
end
