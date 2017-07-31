# frozen_string_literal: true

require 'sinatra'
require 'tilt/erb'
require 'uri'
require 'active_support'
require 'plaintweet/repository'
require 'english'

module Plaintweet
  class WebApp < Sinatra::Base
    set :root, File.join(File.dirname(__FILE__), '..', '..')
    set :views, settings.root + '/views'

    configure :production, :development do
      enable :logging
    end

    get '/' do
      erb :about
    end

    get %r{/.*/(\d+)} do |id|
      begin
        @tweet = Repository.new.tweet(id)

        if params[:q] && params[:q] != 'false'
          URI.escape erb :tweet, content_type: 'text/plain'
        else
          erb :tweet, content_type: 'text/plain'
        end
      rescue
        $ERROR_INFO.message
      end
    end
  end
end
