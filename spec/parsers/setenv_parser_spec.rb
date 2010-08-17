require File.dirname(__FILE__) + "/../spec_helper"

module Tcsh2Bash
  describe SetenvParser do
    before :each do
      @parser = SetenvParser.new
    end

    it 'should convert a basic setenv' do
      convert_to_bash("setenv EDITOR vim").should == "export EDITOR=vim"
    end

    it 'should convert a setenv with a path' do
      convert_to_bash("setenv PATH ~/bin").should == "export PATH=~/bin"
    end
  end
end
