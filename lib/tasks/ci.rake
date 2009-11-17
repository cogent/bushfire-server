desc "The Build!"
task :ci => [ 'db:migrate', :spec, :quality, :cucumber ]
