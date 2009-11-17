begin
  gem 'flog', '=2.1.0'
  require 'flog'

  desc "Analyze for code complexity"
  task :flog do
    flog = Flog.new
    flog.flog_files ['app']
    threshold = 30

    bad_methods = flog.totals.select do |name, score|
      score > threshold
    end
    bad_methods.sort { |a,b| a[1] <=> b[1] }.each do |name, score|
      puts "%8.1f: %s" % [score, name]
    end

    raise "#{bad_methods.size} methods have a flog complexity > #{threshold}" unless bad_methods.empty?
  end
rescue LoadError
  desc "flog rake task not available"
  task :flog do
    abort "flog rake task is not available. Be sure to install flog as a gem or plugin"
  end
end

begin
  require 'flay'

  desc "Analyze for code duplication"
  task :flay do
    threshold = 25
    flay = Flay.new({:fuzzy => false, :verbose => false, :mass => threshold})
    flay.process(*Flay.expand_dirs_to_files(['app']))

    flay.report

    raise "#{flay.masses.size} chunks of code have a duplicate mass > #{threshold}" unless flay.masses.empty?
  end
rescue LoadError
  desc "flay rake task not available"
  task :flay do
    abort "flay rake task is not available. Be sure to install flay as a gem or plugin"
  end
end

begin
  require 'roodi'
  require 'roodi_task'
  
  RoodiTask.new 'roodi', ['app/**/*.rb', 'lib/**/*.rb'], 'roodi.yml'
rescue LoadError
  desc "roodi rake task not available"
  task :roodi do
    abort "roodi rake task is not available. Be sure to install roodi as a gem or plugin"
  end
end

begin
  require 'metric_fu'
  MetricFu::Configuration.run {}
rescue LoadError
  namespace :metrics do
    desc "Metric Fu rake task not available"
    task :all do
      abort "Metric Fu rake task is not available. Be sure to install Metric Fu as a gem or plugin"
    end
  end
end

task :quality => [:flog, :flay, :roodi]
