require './config/environment'

class SignupController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/registration/signup" do
    erb :"/registrations/signup"
  end

  post "/registration" do
    @care_giver = CareGiver.new(name: params["name"], user_name: params["user_name"], password: params["password"])
    @care_giver.save
    session[:care_giver_id] = @care_giver.id
    binding.pry
    redirect "/children"
  end

end
