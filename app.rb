require 'sinatra'
require 'sinatra/reloader'

register Sinatra::Reloader

get '/' do
  "hello, world!!!\n"
end
