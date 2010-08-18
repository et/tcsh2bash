require 'spec_helper'

module Tcsh2Bash
  describe AssignmentParser do

    before :each do
      @parser = AssignmentParser.new
    end

    describe 'set assignment' do
      it 'should parse this' do
        parse('set foo = bar').should_not be_nil
      end

      it 'should convert it to bash' do
        convert_to_bash('set foo = bar').should == 'foo=bar'
      end
    end

    describe 'alias assignment' do
      it 'should parse this alias' do
        parse('alias foo bar').should_not be_nil
      end
      it 'should convert it to bash' do
        convert_to_bash('alias foo bar').should == 'alias foo=bar'
      end
    end

    describe 'setenv assignment' do
      it 'should parse this setenv' do
        parse('setenv foo bar').should_not be_nil
      end
      it 'should convert it to bash' do
        convert_to_bash('setenv foo bar').should == 'export foo=bar'
      end
    end
  end
end
