require 'spec_helper'

module Tcsh2Bash
  describe BooleanParser do
    before :each do
      @parser = BooleanParser.new
    end

    describe "string comparison" do
      specify { convert_to_bash('("foo" == "foo")').should == '[ "foo" == "foo" ]' }
      specify { convert_to_bash('("foo" != "bar")').should == '[ "foo" != "bar" ]' }

      specify { convert_to_bash('($foo == "foo")').should == '[ $foo == "foo" ]' }
      specify { convert_to_bash('("bar" != $foo)').should == '[ "bar" != $foo ]' }
    end

    describe "numeric comparison" do
      specify { convert_to_bash("(1 == 1)")   .should == "[ 1 -eq 1 ]" }
      specify { convert_to_bash("($foo >= 1)").should == "[ $foo -ge 1 ]" }
      specify { convert_to_bash("(1 < $foo)") .should == "[ 1 -lt $foo ]" }
    end

    # @todo - Figure out this situation
    describe "multiple parentheses" do
      specify { convert_to_bash('((("foo" == "bar")))').should == '[ "foo" == "bar" ]' }
    end

=begin
    describe "logical connectives" do
      specify { parse('"foo" == "foo" && "bar" == "bar"').should_not be_nil }

      specify { parse('("foo" == "foo") || ("bar" != "bar")').should_not be_nil }
      specify { convert_to_bash('["foo" == "foo"] || ["bar" != "bar"]').should_not be_nil }

      specify { parse('!("foo" == "bar")').should_not be_nil }
    end
=end

    # @todo - variable only if ($foo) where $foo is 0 or 1

  end
end

