require './config/environment'

class LoginController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :"/sessions/login"
  end

  get "/login" do
    erb :"/sessions/login"
  end

  post "/login" do
    # binding.pry
    erb :"/children/children"
  end

end
