require 'spec_helper'

module Tcsh2Bash
  describe ForParser do

    before :each do
      @parser = ForParser.new
    end

    describe 'foreach statement' do

input = <<FOREACH.strip
foreach letter (a b c d)
  echo $letter
end
FOREACH

output = <<FOREACH.strip
for letter in a b c d
do
  echo $letter
done
FOREACH

    specify { convert_to_bash(input).should == output }

    end
  end
end


