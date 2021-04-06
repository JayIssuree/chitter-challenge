require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models/peep'
require './models/user'

class Chitter < Sinatra::Base

    enable :sessions
    register Sinatra::Flash

    get '/' do
        redirect '/chitter'
    end
    
    get '/chitter' do
        @user = User.find(session[:user_id]) if session[:user_id]
        @peeps = Peep.all.sort_by(&:created_at).reverse
        erb(:homepage)
    end

    post '/peep' do
        Peep.create(content: params[:peep_text])
        redirect '/chitter'
    end

    get '/users/new' do
        erb(:'users/new')
    end

    post '/users' do
        user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.save
            session[:user_id] = user.id
            redirect '/chitter'
        else
            session[:user_id] = nil
            flash[:notice] = 'Username already taken or passwords do not match'
            redirect '/users/new'
        end
    end

    get '/session/new' do
        erb(:'session/new')
    end

    post '/session' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/chitter'
        else
            session[:user_id] = nil
            flash[:notice] = 'Incorrect username or password'
            redirect '/session/new'
        end
    end


    run! if app_file == $0

end