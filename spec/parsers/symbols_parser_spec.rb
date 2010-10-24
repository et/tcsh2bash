require 'spec_helper'

module Tcsh2Bash
  describe SymbolsParser do

    before :each do
      @parser = SymbolsParser.new
    end

    describe 'strings' do
      it 'should parse double quoted string' do
        parse('"hello world"').should_not be_nil
      end

      it 'should parse single quoted strings' do
        parse("'hello'").should_not be_nil
      end

      describe 'mixed quoted string' do
        it 'should parse single quotes on the outside' do

output = <<MIXED.strip
'Hello "World"'
MIXED
          parse(output).should_not be_nil
        end

        it 'should parse double quotes on the outside' do
output = <<MIXED.strip
"Hello 'World'"
MIXED
          parse(output).should_not be_nil
        end
      end
    end
  end
end
