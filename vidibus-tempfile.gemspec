# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'vidibus/tempfile'

Gem::Specification.new do |s|
  s.name        = 'vidibus-tempfile'
  s.version     = Vidibus::Tempfile::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = 'Andre Pankratz'
  s.email       = 'andre@vidibus.com'
  s.homepage    = 'https://github.com/vidibus/vidibus-tempfile'
  s.summary     = 'Extends Tempfile'
  s.description = 'Adds mime type and file extension to Tempfile.'
  s.license     = 'MIT'

  s.required_rubygems_version = '>= 1.3.6'

  s.add_development_dependency 'bundler', '>= 1.0.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'rspec', '~> 2'
  s.add_development_dependency 'rr'
  s.add_development_dependency 'simplecov'

  s.files = Dir.glob('{lib,app,config}/**/*') + %w[LICENSE README.rdoc Rakefile]
  s.require_path = 'lib'
end
