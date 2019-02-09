require 'sinatra'
require 'sinatra/reloader'

register Sinatra::Reloader

get '/' do
  p request.env
  "hello, world!!!\n"
end

get '/hoge' do
  name = params["name"]
  "My name is #{name}.\n"
end

post '/hoge' do
  name = params["name"]
  "My name is #{name}.\n"
end
