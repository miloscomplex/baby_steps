class ChildrenController < ApplicationController

    get "/children" do
      if logged_in?
        @care_giver = current_user
        @children = current_user.children
        erb :"/children/children"
      else
        error_message
        erb:"sessions/login"
      end
    end

    get "/children/new" do
      if logged_in?
        @care_giver = current_user
        erb :"children/new"
      else
        error_message
        erb:"sessions/login"
      end
    end

    get "/children/:id" do
      if logged_in?
        if @child = current_user.children.find_by(id: params[:id])
          erb :"children/child"
        else
          erb :"children/error"
        end
      else
        error_message
        erb :"sessions/login"
      end
    end

    post "/children/new" do
      if logged_in?
        @child = Child.new(name: params["name"], birthdate: params["birthdate"], gender: params["gender"], care_giver_id: current_user.id)
        if @child.save
          redirect "/children"
        end
      end
      error_message
      erb :"sessions/login"
    end

    get "/children/:id/update" do

      erb :"children/update"
    end

end
