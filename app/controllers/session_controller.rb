class SessionController < ApplicationController

  get "/logout" do
    session.clear
    erb :"/sessions/logout"
  end

  get "/children" do
    if logged_in?
      @care_giver = CareGiver.find(session[:care_giver_id])
      erb :"/children/children"
    else
      @message = "<p style='color:red;'>You are not logged in!</p>"
      erb:"sessions/login"
    end
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
