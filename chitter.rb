require 'sinatra'

class Chitter < Sinatra::Base

    get '/chitter' do
        erb(:chitter)
    end

    
    run! if app_file == $0

end