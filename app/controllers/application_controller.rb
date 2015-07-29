require_relative "../../config/environment"
require_relative "../models/model.rb"



class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get "/" do
    erb :index
    end
end