class SignupController < ApplicationController

  get "/registration/signup" do
    erb :"/registrations/signup"
  end

  post "/registration" do

    @care_giver = CareGiver.new(name: params["name"], email: params["email"], password: params["password"])
    # binding.pry
    if @care_giver
      @care_giver.save
      session[:care_giver_id] = @care_giver.id
      redirect "/children"
    end
    redirect "/registrations/error"
  end

  get "/registration/error" do
    erb :"/registrations/error"
  end

end
