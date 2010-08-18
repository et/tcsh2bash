#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/lib/tcsh2bash'

if ARGV.empty?
  puts "Must provide at least one file argument"
  exit
end

# Make sure that each is a file
ARGV.each do |file|
  unless File.exist?(file)
    puts "Unable to read file: #{file}"
    exit
  end
end


# Open all the files and parse them
ARGV.each do |file|
  contents = File.open(file, 'r') { |f| f.read }

  # Do some pre parsing to make this input suitable
  @pre_parser = Tcsh2Bash::PreParser.new
  contents = @pre_parser.parse(contents)

  # Now try and parse it for real
  @parser = Tcsh2Bash::TcshParser.new
  if @parser.parse(contents)
    puts @parser.parse(contents).to_bash
    #p @parser.parse(contents)
  else
    puts "Problem parsing file"
  end
end
