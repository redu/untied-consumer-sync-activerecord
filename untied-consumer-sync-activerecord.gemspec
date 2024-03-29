# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'untied-consumer-sync-activerecord/version'

Gem::Specification.new do |gem|
  gem.name          = "untied-consumer-sync-activerecord"
  gem.version       = Untied::Consumer::Sync::Activerecord::VERSION
  gem.authors       = ["Juliana Lucena"]
  gem.email         = ["julianalucenaa@gmail.com"]
  gem.description   = %q{A ActiveRecord backend for Untied Consumer Sync.}
  gem.summary       = %q{A ActiveRecord backend for Untied::Consumer::Sync.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'sqlite3'

  gem.add_runtime_dependency 'untied-consumer-sync', '~> 0.0'
  gem.add_runtime_dependency 'activerecord', '~> 3.2'

   if RUBY_VERSION < "1.9"
    gem.add_development_dependency "ruby-debug"
  else
    gem.add_development_dependency "debugger"
  end
end
