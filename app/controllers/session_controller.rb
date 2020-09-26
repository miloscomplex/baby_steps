require './config/environment'

class SessionController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/logout" do
    session.clear
    erb :"/sessions/logout"
  end

  get "/children" do
    @care_giver = CareGiver.find(session[:care_giver_id])
    erb :"/children/children"
  end

  get "/" do
    erb :"/sessions/login"
  end

  get "/login" do
    erb :"/sessions/login"
  end

  post "/login" do
    @care_giver = CareGiver.find_by(email: params["email"], password: params["password"])
    if @care_giver
      session[:care_giver_id] = @care_giver.id
      redirect "/children"
    end
    erb :"/sessions/error"
  end

end
