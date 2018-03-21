require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      #shows to data
      #instantiates instance variables and creates objects
      @team = Team.new(params)

      params[:team][:heroes].each do |details|
        Hero.new(details)
      end

      @heroes = Hero.all
      binding.pry
      erb :team
    end



end
