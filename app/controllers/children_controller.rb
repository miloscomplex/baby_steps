class ChildrenController < ApplicationController

    get "/children" do
      if logged_in?
        @care_giver = current_user
        @children = current_user.children
        erb :"/children/children"
      else
        @message = "<p style='color:red;'>You are not logged in!</p>"
        erb:"sessions/login"
      end
    end

    get "/children/:id" do
      if logged_in?
        if @child = current_user.children.find_by(id: params[:id])
          erb :"children/display_child"
        else

          erb :"children/error"
        end
      else
        @message = "<p style='color:red;'>You must log in to see this information!</p>"
        erb:"sessions/login"
      end
    end

end
