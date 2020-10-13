class LogController < ApplicationController

  get "/children/:id/logs/create" do
    if logged_in?
      @child = current_user.children.find_by(id: params[:id])
      if @child.logs.empty?
        erb :"logs/create"
      else
        erb :"logs/error_exists"
      end
    else
      error_message
      erb :"sessions/login"
    end
  end

  #[C]reate
  post "/children/:id/logs/create" do
    if logged_in?
      @child = current_user.children.find_by(id: params[:id])

      @log = Log.new(child_id: params[:id], first_nap_time: params[:first_nap][:time], first_nap_duration: params[:first_nap][:duration], second_nap_time: params[:second_nap][:time], second_nap_duration: params[:second_nap][:duration], wet_diapers: params[:diaper][:wet], solied_diapers: params[:diaper][:soiled], first_feeding: params[:feeding][:first], second_feeding: params[:feeding][:second], third_feeding: params[:feeding][:third], art_and_crafts: params[:activity][:arts_and_crafts], gym_time: params[:activity][:gym_time], independent_play_time: params[:activity][:independent_play_time], music_time: params[:activity][:music_time], sensory_play_time: params[:activity][:sensory_play_time], story_time: params[:activity][:story_time], tummy_time: params[:tummy_time], notes: params[:notes])

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
  get "/children/:id/logs/edit" do
    # erb :"logs/edit"
    if logged_in?
      @child = current_user.children.find_by(id: params[:id])
      @log = @child.logs.find_by(child_id: @child.id)
      erb :"logs/edit"
    else
      error_message
      erb :"sessions/login"
    end
  end

  #Commit [E]dits
  patch "/children/:id/logs/edit" do
    if logged_in?
      @child = current_user.children.find_by(id: params[:id])
      @log = @child.logs.find_by(child_id: @child.id)

      @log.update(first_nap_time: params[:first_nap][:time], first_nap_duration: params[:first_nap][:duration], second_nap_time: params[:second_nap][:time], second_nap_duration: params[:second_nap][:duration], wet_diapers: params[:diaper][:wet], solied_diapers: params[:diaper][:solied], first_feeding: params[:feeding][:first], second_feeding: params[:feeding][:second], third_feeding: params[:feeding][:third], art_and_crafts: params[:activity][:arts_and_crafts], gym_time: params[:activity][:gym_time], independent_play_time: params[:activity][:independent_play_time], music_time: params[:activity][:music_time], sensory_play_time: params[:activity][:sensory_play_time], story_time: params[:activity][:story_time], tummy_time: params[:tummy_time], notes: params[:notes])

      redirect "/children/#{@child.id}"
    else
      error_message
      erb :"sessions/login"
    end
  end

  get "/children/:id/logs/delete" do
    if logged_in?
      @child = current_user.children.find_by(id: params[:id])
      @log = @child.logs.find_by(child_id: @child.id)
      erb :"logs/delete"
    else
      error_message
      erb :"sessions/login"
    end
  end

  delete "/children/:id/logs" do
    if logged_in?
      @child = current_user.children.find_by(id: params[:id])
      @log = @child.logs.find_by(child_id: @child.id)
      @log.delete
      redirect to "/children"
    else
      error_message
      erb :"sessions/login"
    end
  end
end
