class SignupController < ApplicationController

  get "/registration/signup" do
    erb :"/registration/signup"
  end

  post "/registration/signup" do
    #check if the email name combo exists -- done
    #should the email be made lowercase --- stretch feature
    #name cannot contain numbers, periods, etc -- done
     #should it be forced to initial cap? --- some people have odd names
    if @name_email = CareGiver.find_by(name: params[:name]).nil? && CareGiver.find_by(email: params[:email]).nil?
      @care_giver = CareGiver.new(name: params[:name], email: params[:email], password: params[:password])
      # binding.pry
      if @care_giver.save
        session[:care_giver_id] = @care_giver.id
        redirect "/children"
      else
        redirect "/registration/error"
      end
    end
    if !@name_email
      user_exists!
    end
    erb :"/registration/signup"
  end

  get "/registration/error" do
    erb :"/registration/error"
  end

end
