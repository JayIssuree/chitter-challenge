require 'sinatra'
require 'sinatra/activerecord'
require './models/peep'

class Chitter < Sinatra::Base

    get '/' do
        redirect '/chitter'
    end
    
    get '/chitter' do
        @peeps = Peep.all.sort_by(&:created_at).reverse
        erb(:homepage)
    end

    post '/peep' do
        Peep.create(content: params[:peep_text])
        redirect '/chitter'
    end


    run! if app_file == $0

end