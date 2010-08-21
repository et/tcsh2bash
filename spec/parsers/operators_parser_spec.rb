require 'spec_helper'

module Tcsh2Bash
  describe OperatorsParser do
    before :each do
      @parser = OperatorsParser.new
    end

    describe "eq" do
      specify { parse("==").should_not be_nil }
      specify { convert_to_bash("==").should == "-eq" }
    end

    describe "neq" do
      specify { parse("!=").should_not be_nil }
      specify { convert_to_bash("!=").should == "-neq" }
    end

    describe "lt" do
      specify { parse("<").should_not be_nil }
      specify { convert_to_bash("<").should == "-lt" }
    end

    describe "le" do
      specify { parse("<=").should_not be_nil }
      specify { convert_to_bash("<=").should == "-le" }
    end

    describe "gt" do
      specify { parse(">").should_not be_nil }
      specify { convert_to_bash(">").should == "-gt" }
    end

    describe "ge" do
      specify { parse(">=").should_not be_nil }
      specify { convert_to_bash(">=").should == "-ge" }
    end
  end
end

