require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index, locals: {list_of_colors: DB[:colors].to_a}
  end

  get '/colors/new' do
    erb :new
  end

  post '/colors' do
    DB[:colors].insert(:name => params[:name], :characteristic => params[:characteristic], :rating_1_to_5 => params[:rating_1_to_5])
    redirect '/'
  end

  get '/colors/:id' do
    # single_color = DB[:colors][:id => params[:id]]
    # p single_color[:id]
    erb :show, locals: {single_color: DB[:colors][:id => params[:id]]}
  end

  put '/colors/:id' do
    DB[:colors].where(:id => params[:id]).update(:name => params[:name], :characteristic => params[:characteristic], :rating_1_to_5 => params[:rating_1_to_5])
    redirect "/colors/#{params[:id]}"
  end

  get '/colors/:id/edit' do
    erb :edit, locals: {single_color: DB[:colors][:id => params[:id]]}
  end

  get '/colors' do
    erb :index, locals: {list_of_colors: DB[:colors].to_a}
  end

end

