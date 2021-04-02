require 'sinatra'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base

    get '/' do
        redirect '/chitter'
    end

    get '/chitter' do
        @peeps = Peep.all
        erb(:chitter)
    end

    post '/chitter/peep' do
        Peep.create(text: params[:peep_text])
        redirect '/chitter'
    end

    run! if app_file == $0

end