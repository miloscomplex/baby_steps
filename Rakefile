ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

desc "start a console session"
task :console do
  Pry.start
end
