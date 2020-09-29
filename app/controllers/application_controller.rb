require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  helpers do

    def current_user
      if session[:care_giver_id]
        CareGiver.find(session[:care_giver_id])
      end
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_logged_out
      if !logged_in?
        redirect "/login"
      end
    end

    def logout!
      session.clear
    end

    def error_message
      @message = "<p style='color:red;'>You are not logged in!</p>"
    end

  end

 end
