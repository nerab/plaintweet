#!/usr/bin/env rake
require 'rake/testtask'
require 'yaml'
require 'active_support/core_ext/string/strip'

task default: :test

Rake::TestTask.new do |test|
  test.libs << 'lib' << 'test' << 'test/unit'
  test.pattern = 'test/unit/test_*.rb'
end
