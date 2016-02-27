# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plaintweet/version'

Gem::Specification.new do |spec|
  spec.name          = 'plaintweet'
  spec.version       = Plaintweet::VERSION
  spec.authors       = ['Nicholas E. Rabenau']
  spec.email         = ['nerab@gmx.at']
  spec.summary       = 'Provides a plain-text version of a given tweet.'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sinatra'
  spec.add_dependency 'twitter'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rerun'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'guard-rack'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-stack_explorer'
end
