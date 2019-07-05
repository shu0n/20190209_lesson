require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"
require './model/user'

register Sinatra::Reloader

set :database,
  adapter: "postgresql", 
  database: "janken_development", 
  user: "janken", 
  password: 'password'

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

get '/janken' do
  userHand = params["hand"]
  compHand = ["guu", "choki", "paa"].sample

  if userHand != "guu" && userHand != "choki" && userHand != "paa"
    "You are wrong! Type again.\n" 
  elsif (userHand == "guu" && compHand == "choki") || (userHand == "choki" && compHand == "paa") || (userHand == "paa" && compHand == "guu")
    "I am #{compHand}. You are #{userHand}. You win.\n"
  elsif (userHand == "guu" && compHand == "paa") || (userHand == "choki" && compHand == "guu") || (userHand == "paa" && compHand == "choki")
    "I am #{compHand}. You are #{userHand}. You lose.\n"
  else
    "Draw!\n"
  end
end
