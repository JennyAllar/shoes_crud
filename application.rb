require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index, locals: {array_of_shoes: DB[:shoes].to_a}
  end

  get '/shoes/new' do
    erb :"/shoes/new"
  end

  post '/shoes' do
    shoes_id = params[:id]
    DB[:shoes].where(id: shoes_id).insert(style: params[:style], size: params[:size])
    redirect '/'
  end

  get '/shoes/:id/edit' do
    shoe_id = params[:id]
    shoe = DB[:shoes][id: shoe_id]
    erb :"/shoes/update", locals: {shoe: shoe}
  end

  put '/shoes/:id' do
    shoes_id = params[:id]
    DB[:shoes].where(id: shoes_id).update(style: params[:style], size: params[:size])
    redirect '/'
  end

end