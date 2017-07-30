# frozen_string_literal: true

require 'spec_helper'

require 'webmock/rspec'
require 'plaintweet/web_app'

# rubocop:disable Metrics/BlockLength
describe 'Web App' do
  include Rack::Test::Methods
  let(:twitter) { double }
  let(:status) { double }
  let(:user) { double }

  before do
    WebMock.disable_net_connect!
    allow_any_instance_of(Plaintweet::Repository).to receive(:twitter).and_return(twitter)
    allow(status).to receive(:user).and_return(user)
  end

  after do
    WebMock.allow_net_connect!
  end

  def app
    Plaintweet::WebApp
  end

  it 'has a root page' do
    get '/'
    expect(last_response).to be_ok
  end

  context 'with a user id containing a number' do
    before do
      allow(status).to receive(:text).and_return('mocked status')
      allow(user).to receive(:screen_name).and_return('mock user')
      allow(twitter).to receive(:status).with('891545131417030656').and_return(status)
    end

    it "provides a tweet's plain text" do
      get '/https://twitter.com/dcxxx187/status/891545131417030656'
      expect(last_response).to be_ok
    end
  end

  context 'with a user id that has no numbers' do
    before do
      allow(status).to receive(:text).and_return('mocked status')
      allow(user).to receive(:screen_name).and_return('mock user')
      allow(twitter).to receive(:status).with('891574840787959808').and_return(status)
    end

    it "provides a tweet's plain text" do
      get '/https://twitter.com/_Meicus/status/891574840787959808'
      expect(last_response.body).to eq("\"mocked status\" -- @mock user auf #twitter\n")
      expect(last_response).to be_ok
    end
  end
end
