task :base_console do
  require 'irb'
  require 'irb/completion'
  ARGV.clear
  puts "starting console"
  IRB.start
end
