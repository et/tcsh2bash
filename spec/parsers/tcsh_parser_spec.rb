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
      it 'should parse reluctantly parse this. We cannot tell if this really is a bad statement.' do
        output = <<EOF.strip
foo=bar
FOO BAR
EOF
        convert_to_bash("set foo=bar\nFOO BAR").should == output
      end
    end

    describe 'comment' do
      single_comment = "#single comment"
      specify { convert_to_bash(single_comment).should == single_comment }

      multi_comment = <<EOF.strip
#######################
# Multi line comment
# more comments
#######################
EOF
      specify { convert_to_bash(multi_comment).should == multi_comment }

      it 'should handle a command following a command' do

        multi_comment_with_command_after = multi_comment + "\n"
        multi_comment_with_command_after += <<EOF.strip
setenv EDITOR vim
EOF
        convert_to_bash(multi_comment_with_command_after).should == multi_comment + "\nexport EDITOR=vim"
       
      end

      #puts convert_to_bash(multi_comment_with_command_after)
    end

  end
end
