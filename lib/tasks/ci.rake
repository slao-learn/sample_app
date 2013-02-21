desc "Continuous integration task"
task :ci => ['ci:test', 'ci:deploy'] do
  puts "Finished!"
end

namespace :ci do
  task :build do
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
  end

  task :test => [:build] do
    Rake::Task['spec'].invoke
  end

  task :deploy do
    puts "deploy"
  end
end
