#!/usr/bin/env ruby

require 'yaml'

# Vars
log = ARGV.first

## 3 to 6 months
months3to6 = {}
## 6 to 12 months
months6to12 = {}
## 12 to 24 months
months12to24 = {}
## 24+ months
months24plus = {}

# Validation


# Analyse data from log file
files = YAML.load_file(log)
puts "Analysing #{files.length} files"
files.each do |file, info|
  # Short UTC var for last access time
  la = info['last_access'].utc

  # If LAST_ACCESS greater than 24 months ago
  # 365*24*60*60 (days x hours x mins x seconds)
  twoyears = Time.now.utc - (730*24*60*60)
  oneyear = Time.now.utc - (365*24*60*60)
  halfyear = Time.now.utc - (182*24*60*60)
  quarteryear = Time.now.utc - (91*24*60*60)

  if la < twoyears then
    months24plus[file] = info
  elsif la < oneyear then
    months12to24[file] = info
  elsif la < halfyear then
    months6to12[file] = info
  elsif la < quarteryear then
    months3to6[file] = info
  end
end

# Printing results
puts "A total of #{files.length} have been analysed"

months24size = months24plus.map { |k, v| v['size'] }
puts "There are #{months24plus.length} files that haven't been accessed in more than 24 months, totalling #{months24size.sum} bytes"

months12size = months12to24.map { |k, v| v['size'] }
puts "There are #{months12to24.length} files that haven't been accessed in 12 to 24 months, totalling #{months12size.sum} bytes"

months6size = months6to12.map { |k, v| v['size'] }
puts "There are #{months6to12.length} files that haven't been accessed in 6 to 12 months, totalling #{months6size.sum} bytes"

months3size = months3to6.map { |k, v| v['size'] }
puts "There are #{months3to6.length} files that haven't been accessed in 3 to 6 months, totalling #{months3size.sum} bytes"

