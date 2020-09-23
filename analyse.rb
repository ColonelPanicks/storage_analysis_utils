#!/usr/bin/env 

# Vars
log = ARGV.first

3to6 = {}
6to12 = {}
12to24 = {}

# Validation


# Analyse data from log file
files = File.read(log).to_h
puts "Analysing #{files.count} files"
files.each do |file| 
  puts file['last_access']
  puts
  # If LAST_ACCESS greater than 24 months ago
  #if file['last_access'].utc > 
end
