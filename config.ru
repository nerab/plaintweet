require 'bundler'
Bundler.require

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'plaintweet'

run Rack::URLMap.new('/' => Plaintweet::WebApp)
