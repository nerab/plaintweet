# frozen_string_literal: true

require 'spec_helper'
require 'plaintweet/repository'

RSpec.describe 'Tweets Repository', integration: true do
  subject(:repository) { Plaintweet::Repository.new }

  before do
    WebMock.allow_net_connect!
  end

  it 'provides the tweet' do
    tweet = repository.tweet('https://twitter.com/dcxxx187/status/891545131417030656')
    expect(tweet).to be
  end

  it "provides the tweet's text" do
    tweet = repository.tweet('https://twitter.com/dcxxx187/status/891545131417030656')
    expect(tweet.text).to_not be_empty
  end

  it "provides the tweet's author and her screen name" do
    tweet = repository.tweet('https://twitter.com/dcxxx187/status/891545131417030656')
    expect(tweet.user).to be
    expect(tweet.user.screen_name).to eq('dcxxx187')
  end
end
