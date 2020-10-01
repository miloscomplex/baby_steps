class LogController < ApplicationController

  get "/children/:id/create" do
    if logged_in?
      @child = current_user.children.find_by(id: params[:id])
      erb :"logs/create"
    else
      error_message
      erb :"sessions/login"
    end
  end

  post "/children/create" do
    "post children update"
  end

end
