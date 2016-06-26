# add an RSpec-related Rake task to our Rakefile, which will enable us (manually) 
# or Guard to execute the task and run the RSpec test suite
require 'rspec/core/rake_task'


require "bundler/gem_tasks"


# Default directory to look in is `/specs`
# Run with `rake spec`
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format', 'nested']
end
  

task :default => :spec
