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

get '/janken' do
  userHand = params["hand"]
  compHands = ["guu", "choki", "paa"]
  compHand = compHands.sample
 
  if (userHand == "guu" && compHand == "choki") || (userHand == "choki" && compHand == "paa") || (userHand == "paa" && compHand == "guu")
    "I am #{compHand}. You are #{userHand}. You win.\n"
  elsif (userHand == "guu" && compHand == "paa") || (userHand == "choki" && compHand == "guu") || (userHand == "paa" && compHand == "choki")
    "I am #{compHand}. You are #{userHand}. You lose.\n"
  else
    "Draw!"
  end
end
