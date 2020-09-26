require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/logout" do
    erb :logout
  end

  get "/children" do
    binding.pry
    @care_giver = CareGiver.find(session[:care_giver_id])
    erb :"/children/children"
  end

end
