require 'spec_helper'

module Tcsh2Bash
  describe BasicTokensParser do

    before :each do
      @parser = BasicTokensParser.new
    end

    describe 'variables' do
      it 'should parse this variable' do
        parse('foo').should_not be_nil
      end
    end

    describe 'assignments' do
      describe 'valid' do
        it 'should parse this assignment' do
          parse('foo bar').should_not be_nil
        end

        it 'should convert it to a bash assignment' do
          convert_to_bash('foo bar').should == "foo=bar"
        end
      end

      describe 'invalid' do
        it 'should not parse this assignment' do
          parse('234foo bar').should be_nil
        end
      end
    end
  end
end
