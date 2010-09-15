require File.dirname(__FILE__) + "/../lib/tcsh2bash"

def parse(input)
  @parser.parse(input, Dir.pwd)
end

def convert_to_bash(input)
  parse(input).to_bash
end
