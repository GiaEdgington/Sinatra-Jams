require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get '/artists' do
    @artists = Artist.all
    erb :index
  end

  get '/artists/new' do
    erb :new
  end

  #Create Action
  post '/artists' do
    @artist = Artist.create(params)
    redirect to "/artists/#{@artist.id}"
  end

  #Show Action
  get "/artists/:id" do
    @artist = Artist.find(params[:id])
    erb :show
  end

  #Edit Action
  get "/artists/:id/edit" do
    @artist = Artist.find(params[:id])
    erb :edit
  end

  put "/artists/:id" do
    @artist = Artist.find(params[:id])
    @artist.update(params[:artist])

    redirect to "/artists/#{@artist.id}"
  end

  delete "/artists/:id" do
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect to "/artists"
  end

end
