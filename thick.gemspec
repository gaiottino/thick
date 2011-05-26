# encoding: utf-8

$: << File.expand_path('../lib', __FILE__)

require 'thick/version'

Dir['ext/*.jar'].each { |jar| require jar }


Gem::Specification.new do |s|
  s.name        = 'thick'
  s.version     = Thick::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Daniel Gaiottino']
  s.email       = ['daniel@burtcorp.com']
  s.homepage    = 'http://github.com/gaiottino/thick'
  s.summary     = %q{Jetty JRuby Wrapper}
  s.description = %q{A simple JRuby wrapper for the Jetty server}

  s.rubyforge_project = 'thick'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w(lib)
end
