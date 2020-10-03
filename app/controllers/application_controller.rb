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
      @message = "<p class='error'>You are not logged in!</p>"
    end

    def user_exists!
      @message = "<p class='error'>The email or name is already registered!"
    end
  end

 end
