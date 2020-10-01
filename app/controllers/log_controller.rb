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

  #[C]reate
  post "/children/:id/create" do
    if logged_in?
      @child = current_user.children.find_by(id: params[:id])

      @log = Log.new(child_id: params[:id], first_nap_time: params[:first_nap][:time], first_nap_duration: params[:first_nap][:duration], second_nap_time: params[:second_nap][:time], second_nap_duration: params[:second_nap][:duration], wet_diapers: params[:diaper][:wet], solied_diapers: params[:diaper][:solied], first_feeding: params[:feeding][:first], second_feeding: params[:feeding][:second], third_feeding: params[:feeding][:third], art_and_crafts: params[:activity][:arts_and_crafts], gym_time: params[:activity][:gym_time], independent_play_time: params[:activity][:independent_play_time], music_time: params[:activity][:music_time], sensory_play_time: params[:activity][:sensory_play_time], story_time: params[:activity][:story_time], tummy_time: params[:tummy_time])

      if @log.save
        redirect to "/children/#{@child.id}"
      else
        erb :"/logs/error"
      end
    else
      error_message
      erb :"sessions/login"
    end
  end

  #[E]dit
  get "/children/:id/edit" do
    "this is the edit page"
    # erb :"logs/edit"
  end
end
