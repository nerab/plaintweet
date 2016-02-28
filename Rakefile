#!/usr/bin/env rake
require 'rake/testtask'
require 'yaml'
require 'active_support/core_ext/string/strip'

task default: :test

Rake::TestTask.new do |test|
  test.libs << 'lib' << 'test' << 'test/unit'
  test.pattern = 'test/unit/test_*.rb'
end

namespace :docker do
  desc 'Run the docker container'
  task :run do
    sh 'lpass sync'
    config = YAML.load(`lpass show plaintweet --notes`)
    fail "Error: Lastpass doesn't seem to contain the plaintweet configuration" unless config

    sh <<-EOS.strip_heredoc.tr("\n", ' ')
      docker run
          --env "TWITTER_CONSUMER_KEY=#{config.fetch('TWITTER_CONSUMER_KEY')}"
          --env "TWITTER_CONSUMER_SECRET=#{config.fetch('TWITTER_CONSUMER_SECRET')}"
          --env "TWITTER_OAUTH_TOKEN=#{config.fetch('TWITTER_OAUTH_TOKEN')}"
          --env "TWITTER_OAUTH_TOKEN_SECRET=#{config.fetch('TWITTER_OAUTH_TOKEN_SECRET')}"
          -p 49257:5000
          --detach=true
          --name plaintweet
      nerab/plaintweet
    EOS
  end
end
