class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_path
        else
          redirect_to login_path, {alert: "Your Username or Password was invalid"}
        end
    end
   
    private
   
    def auth
      request.env['omniauth.auth']
    end

    def destroy
        session.delete :user_id
        redirect_to "/login"
     end

  end