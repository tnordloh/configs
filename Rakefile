TEXT = <<-EOS
task :console do
  #add your 'lib require statements here'
  require 'irb'
  require 'irb/completion'
  ARGV.clear
  IRB.start
end
                                                                                 
require 'rake/testtask'
Rake::TestTask.new do |t|                                                        
  t.libs << "test"                                                               
  t.test_files = FileList['test/*_test.rb']                                      
  t.verbose = true                                                               
end
EOS

desc "set up base console"
task :console do
#put your specific requirements here.
  Rake::Task[:base_console].invoke
end

task :skel_dirs do
  basedir = ENV["BASE"] || "skel"
  mkdir basedir 
  %w[lib bin test].each {|dir| mkdir File.join(basedir,dir) } 
end

task :skel_rake_file do
  basedir = ENV["BASE"] || "."
  File.open(File.join(ENV["BASE"],'Rakefile'), 'w') do |f|
    f.write(TEXT)
  end
end

task :flat_skel do
  name = ENV["BASE"]
  cwd = Rake.original_dir
  touch "#{cwd}/#{name}.rb"
  touch "#{cwd}/#{name}_test.rb"
  cp "#{ENV["HOME"]}/vim/test_template.rb","#{cwd}/#{name}_test.rb" 
  touch "#{cwd}/README.md"
end

task :skel => [:skel_dirs, :skel_rake_file] 

task :whereami do
  puts Rake.original_dir
end
