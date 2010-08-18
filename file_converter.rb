#!/usr/bin/env ruby

require 'optparse'
require File.dirname(__FILE__) + '/lib/tcsh2bash'
require File.dirname(__FILE__) + '/lib/trollop'

opts = Trollop::options do
  opt :output, "File to output converted bash", :type => String
end

# Try and read the file
tcsh_file = ARGV[0]
unless File.exist?(tcsh_file)
  puts "Unable to read file: #{tcsh_file}"
  exit
end

contents = File.open(tcsh_file, 'r') { |f| f.read }
contents.strip!

@parser = Tcsh2Bash::TcshParser.new
contents = 'alias blah foo alias choo loo'
if @parser.parse(contents)
  puts @parser.parse(contents).to_bash
else
  puts "Problem parsing file"
end
