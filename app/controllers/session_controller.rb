class SessionController < ApplicationController

  get "/logout" do
    logout!
    erb :"/sessions/logout"
  end

  get "/" do
    erb :"/sessions/login"
  end

  get "/login" do
    erb :"/sessions/login"
  end

  post "/login" do
    @care_giver = CareGiver.find_by(email: params[:email])
    if @care_giver && @care_giver.authenticate(params[:password])
      session[:care_giver_id] = @care_giver.id
      redirect "/children"
    else
      @message = "<p style='color:red;'>Your email or password does not match our records</p>"
      erb :"/sessions/login"
    end
  end

end
