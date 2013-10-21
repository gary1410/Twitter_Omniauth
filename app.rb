require 'sinatra'
require 'sinatra/activerecord'
require './models/user'
require './helper'
require './environment'
require 'omniauth-twitter'
require 'tux'

set :database, "sqlite3:///twitter.db"
enable :sessions

use OmniAuth::Builder do
  provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end

get '/' do
  erb :index
end

# get '/request' do
#   redirect request_token.authorize_url
# end

# get '/auth' do
#   get_access_token
#   erb :tweet
# end

post '/tweet/new' do
  tweet = client.update(params[:text])
  if tweet
    tweet.text
  else
    status 500
    "Something bad happened :("
  end
end

get '/auth/twitter/callback' do
  # p env['omniauth.auth'].credentials.secret
  # p @params
  # p params[:oauth_token]
  session[:token] = env['omniauth.auth'].credentials.token
  session[:secret] = env['omniauth.auth'].credentials.secret
  # env['omniauth.auth']
  erb :tweet
end

auth[:token]