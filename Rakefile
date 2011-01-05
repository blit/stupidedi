
task :default => :spec

task :console do
  sh *%w(irb -I lib -r stupidedi)
end

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new do |t|
    t.verbose = false
    t.pattern = "spec/examples/**/*.example"
    t.rspec_opts = %w(--color --format p)
  end
rescue LoadError => first
  begin
    require "spec/rake/spectask"
    Spec::Rake::SpecTask.new do |t|
      t.pattern = "spec/examples/**/*.example"
      t.spec_opts << "--color"
      t.spec_opts << "--format p"
    end
  rescue LoadError => second
    task :spec do
      warn "couldn't load rspec version 1 or 2:"
      warn "  #{first}"
      warn "  #{second}"
      exit 1
    end
  end
end

begin
  require "rcov"

  begin
    require "rspec/core/rake_task"
    RSpec::Core::RakeTask.new(:rcov) do |t|
      t.rcov = true
      t.rcov_opts = "--exclude spec/,gems/"

      t.verbose = false
      t.pattern = "spec/examples/**/*.example"
      t.rspec_opts = %w(--color --format=p)
    end
  rescue LoadError => first
    begin
      require "spec/rake/spectask"
      Spec::Rake::SpecTask.new(:rcov) do |t|
        t.rcov = true
        t.rcov_opts = %w(--exclude spec/,gems/)

        t.pattern = "spec/examples/**/*.example"
        t.spec_opts << "--color"
        t.spec_opts << "--format=p"
      end
    rescue LoadError => second
      task :rcov do
        warn "couldn't load rspec version 1 or 2:"
        warn "  #{first}"
        warn "  #{second}"
        exit 1
      end
    end
  end
rescue LoadError => e
  task :rcov do
    warn "couldn't load rcov:"
    warn "  #{e}"
    exit 1
  end
end

begin
  require "yard"

  YARD::Rake::YardocTask.new do |t|
    t.files   = %w(lib/**/*.rb)
    t.options = %w(--no-private)
  end
rescue LoadError => e
  task :yard do
    warn "couldn't load yard:"
    warn "  #{e}"
    exit 1
  end
end
