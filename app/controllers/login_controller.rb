require './config/environment'

class LoginController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :"/login/login"
  end

  get "/login" do
    erb :"/login/login"
  end

  get "/new-account" do
    erb :"/login/new"
  end

  post "/children" do
    erb :"/children/children"
  end

end
