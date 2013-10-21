require 'twitter'

ENV['CONSUMER_KEY'] = ''
ENV['CONSUMER_SECRET'] = ''

Twitter.configure do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
end