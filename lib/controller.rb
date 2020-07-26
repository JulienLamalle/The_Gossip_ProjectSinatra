require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do 
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do 
    id = (params["id"])
    erb :show, locals: {gossips: Gossip.find(id)}
  end

  get '/gossips/:id/edit/' do 
    erb :edit, locals: {gossip: Gossip.update(params["id"],params["gossip_author"],params["gossip_content"])}
  end

  post '/gossips/edit/' do
    Gossip.update(params["id"],params["gossip_author"],params["gossip_content"])
    redirect '/'
  end
end