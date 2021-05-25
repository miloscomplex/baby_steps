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
      erb :"sessions/login"
    end
  end

  get "/children/delete" do
    if logged_in?
      @care_giver = current_user
      @children = current_user.children
      erb :"children/delete"
    else
      error_message
      erb :"sessions/login"
    end
  end

  get "/children/:id/edit" do
    if logged_in?
      @care_giver = current_user
      set_child
      erb :"/children/edit"
    else
      error_message
      erb :"sessions/login"
    end
  end

  get "/children/error" do
    erb :"children/error"
  end

  patch "/children/:id/edit" do
    if logged_in?
      @child = current_user.children.find_by(id: params[:id])
      @child.update(name: params["name"], birthdate: params["birthdate"], gender: params["gender"], care_giver_id: current_user.id)

      redirect "/children/#{@child.id}"
    else
      error_message
      erb :"sesions/login"
    end
  end

  get "/children/:id" do
    if logged_in?
      if @child = current_user.children.find_by(id: params[:id])
        @log = @child.logs.find_by(child_id: @child.id)
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

  delete "/children/delete" do
    if logged_in?
      @child = current_user.children.find_by(id: params[:child_id])
      if !@child.logs.empty?
        @log = @child.logs.find_by(child_id: @child.id)
        @log.delete
      end
      @child.delete

      redirect to "/children"
    end
    error_message
    erb :"sessions/login"
  end

  private
  def set_child
    @child = current_user.children.find_by(id: params[:id])
    if !@child
      redirect "children/error"
    end
  end
end
