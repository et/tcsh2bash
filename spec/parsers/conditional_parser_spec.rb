require 'spec_helper'

module Tcsh2Bash
  describe ConditionalParser do
    before :each do
      @parser = ConditionalParser.new
    end

    it "should parse this one line if statement" do
      parse("if (boolean) alias fire water").should_not be_nil
    end
  end
end
