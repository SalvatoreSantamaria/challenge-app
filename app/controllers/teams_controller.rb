class TeamsController < ApplicationController
    
    skip_before_action :require_user, only: [:new, :create]
    #before_action will be applied to whatever method we specify
    #below, set_team is running from below
    before_action :set_team, only: [:show, :edit, :update]
    before_action :require_same_team, only: [:edit, :update]

    def index
        @teams = Team.all
    end

    def show
        
    end

    def new
        @team = Team.new
    end

    def create
        @team = Team.new(team_params)
        if @team.save
            flash[:sucess] = "You have successfully signed up" #display a message
            redirect_to root_path
        else 
            render 'new' #in event it doesn't work, then re-render page 
        #for whitelist, have to whitelist for created object
        end
    end

    def edit
        
    end

    def update
        @team = Team.find(params[:id])
        # using team params to white list
        if @team.update(team_params)
            flash[:sucess] = "You have successfully update your profile"
            redirect_to team_path(@team) #this could also be redirect_to @team
        else
            render 'edit'
        end
    end

    #private just means available to the this controller only
    private 

    def set_team
        @team = Team.find(params[:id])
    end

    def team_params
        params.require(:team).permit(:name, :email, :password, :password_confirmation) #this will whitelist what we receive for the web form, name and email
    end

    def require_same_team
        if current_user != @team #ifthe current user is not the same as the team object, then redirect to their own profile
        flash[:notice] = "You can only edit your own profile"
            redirect_to team_path(current_user)
        end
    end

end