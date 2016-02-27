#!/usr/bin/env rake
require 'rake/testtask'

task default: :test

Rake::TestTask.new do |test|
  test.libs << 'lib' << 'test' << 'test/unit'
  test.pattern = 'test/unit/test_*.rb'
end
