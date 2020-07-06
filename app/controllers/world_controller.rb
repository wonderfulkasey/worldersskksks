class WorldsController < ApplicationController
    before_action :require_login
   
    def show
      @world = World.find(params[:id])
    end
   
    def index
    end
   
    def create
      @world = World.create(author_id: user_id)
    end
   
    private
   
    def require_login
      return head(:forbidden) unless session.include? :user_id
    end
  end