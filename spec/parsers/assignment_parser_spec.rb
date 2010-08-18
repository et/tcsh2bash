require 'spec_helper'

module Tcsh2Bash
  describe AssignmentParser do

    before :each do
      @parser = AssignmentParser.new
    end

    describe 'set assignment' do
      it 'should parse this' do
        parse('set foo = bar')
      end

      it 'should convert it to bash' do
        convert_to_bash('set foo = bar') == 'foo=bar'
      end
    end

    describe 'alias assignment' do
      it 'should parse this alias' do
        parse('alias foo bar')
      end
      it 'should convert it to bash' do
        convert_to_bash('alias foo bar') == 'alias foo=bar'
      end
    end

    describe 'setenv assignment' do
      it 'should parse this setenv' do
        parse('setenv foo bar')
      end
      it 'should convert it to bash' do
        convert_to_bash('setenv foo bar') == 'export foo=bar'
      end
    end
  end
end
