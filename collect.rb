#!/usr/bin/env ruby

require 'yaml'

# Vars
dir = ARGV.first
log = "collection/#{dir.gsub('/', '')}_#{Time.new.strftime("%Y-%m-%d")}"
files = {}

# Validation
## Check dir exists
## Maybe check dir permissions too?
## Check log writable

# Collect all stat info from directory
puts "Scanning files in #{dir}, logging to #{log}"

file_tree = Dir["#{dir}/**/*.*"]
file_tree.each do |file|
  files[file] = {}
  files[file]['last_access'] = File.stat(file).atime
  files[file]['size'] = File.stat(file).size

  # Write out data (so can rerun on larged filesystems if needs be...)
  File.write(log, files.to_yaml)
end

