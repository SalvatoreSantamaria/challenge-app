class LoginsController < ApplicationController

    skip_before_action :require_user, only: [:new, :create] #will skip the :require_user actions for new and create. :require_user is inheirited from Application Controller

    def new
    end

    def create
        team = Team.find_by(email: params[:logins][:email].downcase) #grab the team
        if team && team.authenticate(params[:logins][:password]) #ifteam exists
            session[:team_id] = team.id   #set session variable
            flash[:notice] = "You have successfully loggen in"
            redirect_to team
        else  
            flash.now[:notice] = "Something was wrong with you login information" #.now will show just on page and then leave, will not store for redirect
            render 'new'
        end
    end

    def destroy
        session[:team_id] = nil
        flash[:notice] = "You have successfully logged out"
        redirect_to root_path
    end

end
