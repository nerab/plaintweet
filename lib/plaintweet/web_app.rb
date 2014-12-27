require 'sinatra'
require 'uri'
require 'active_support'

module Plaintweet
  class WebApp < Sinatra::Base
    set :root, File.join(File.dirname(__FILE__), '..', '..')
    set :views, settings.root + '/views'

    configure :production, :development do
      enable :logging
    end

    @quoting = false

    before :agent => /Workflow/ do
      logger.info "This is a Workflow agent"
      @quoting = true
    end

    get '/' do
      URI.escape erb :about
    end

    get %r{/(\d+)} do |id|
      begin
        @tweet = Repository.new.tweet(id)
        
        if @quoting
          URI.escape erb :tweet, content_type: 'text/plain'
        else
          erb :tweet, content_type: 'text/plain'
        end
      rescue
        $!.message
      end
    end
  end
end
