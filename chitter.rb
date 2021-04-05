require 'sinatra'

class Chitter < Sinatra::Base

    get '/' do
        redirect '/chitter'
    end
    
    get '/chitter' do
        erb(:homepage)
    end

end