require './environment'
require 'twitter'
require 'oauth'
require 'oauth/consumer'

# def create_consumer
#   OAuth::Consumer.new(
#     ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'],
#     :site => "https://api.twitter.com")
# end

# def request_token
#   host = request.host
#   host << ":9393" if request.host == "localhost"
#   session[:request_token] ||=
#     create_consumer.get_request_token(
#       :oauth_callback => "http://#{host}/auth")
# end

# def get_access_token
#   access_token = request_token.get_access_token(
#     :oauth_verifier => params[:oauth_verifier])
#   session[:token] = access_token.token
#   session[:secret] = access_token.secret
#   session.delete(:request_token)
# end

def client
  @client = Twitter::Client.new(
    :oauth_token => session[:token],
    # :oauth_token => "43394879-Pq4u0kx04r4YQX8eFM5kmFx2W7DIGPtkgVxAUZQeA",
    :oauth_token_secret => session[:secret])
    # :oauth_token_secret => 'Mu5nKBAZQdBcWBKen9RNkxlIhaIMnIIdF0sQr1NZKXw')
end