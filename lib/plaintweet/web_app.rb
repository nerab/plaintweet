require 'sinatra'
require 'uri'
require 'active_support'

module Plaintweet
  class WebApp < Sinatra::Base
    set :root, File.join(File.dirname(__FILE__), '..', '..')
    set :views, settings.root + '/views'

    get '/' do
      URI.escape erb :about
    end

    get %r{/(\d+)} do |id|
      begin
        @tweet = Repository.new.tweet(id)
        URI.escape erb :tweet, content_type: 'text/plain'
      rescue
        $!.message
      end
    end
  end
end
