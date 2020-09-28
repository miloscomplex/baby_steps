class ChildrenController < ApplicationController

    get "/children" do
      if logged_in?
        @care_giver = CareGiver.find(session[:care_giver_id])
        @children = Child.all
        erb :"/children/children"
      else
        @message = "<p style='color:red;'>You are not logged in!</p>"
        erb:"sessions/login"
      end
    end

    get "/children/:id" do
      @child = Child.find(params[:id])
      erb :"children/display_child"
    end

end
