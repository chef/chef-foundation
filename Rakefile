# not loaded on msys devkit
unless RUBY_PLATFORM.include?('mingw')
  require "rubocop/rake_task"
  require "cookstyle/chefstyle"

  desc "Run ChefStyle"
  RuboCop::RakeTask.new(:chefstyle) do |task|
    task.options << "--display-cop-names"
    task.options << "config"
  end
end

require "rake/testtask"

desc "Run tests"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.warning = true
  t.verbose = false
end