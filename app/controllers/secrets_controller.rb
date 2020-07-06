class SecretsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:show]
  
    def new
    end
  
    def create
    end
  
    def show
      if session[:name].present?
        render "show"
      else
        redirect_to "/login"
      end
    end
  
  
    private
  
    def require_login
      return head(:forbidden) unless session.include? :current_user
    end
  end