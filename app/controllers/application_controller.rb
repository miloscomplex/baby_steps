require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/logout" do
    session.clear
    erb :"/sessions/logout"
  end

  get "/children" do
    @care_giver = CareGiver.find(session[:care_giver_id])
    erb :"/children/children"
  end

end
