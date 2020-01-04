class ChallengesController < ApplicationController #challenges controller inheriting from app controller
    
    skip_before_action :require_user
    before_action :set_challenge, only: [:show, :edit, :update]
    # def team_two_scoreboard
    #     @team_two_scoreboard = Student.scores.find(2).team_score
    # end

    def index #directs to app/views/challenges/index.html.erb
        @challenges = Challenge.all #this make this available to all of the views
        #@team_two_scoreboard = Student.scores.find(2).team_score
        @scores = Score.all
    end

    def new
        @challenge = Challenge.new
    end

    def show
    end
    
    def edit
    end

    def create
        @challenge = Challenge.new(challenge_params)
        if @challenge.save
            flash[:sucess] = "You have successfully added a challenge" #display a message
            redirect_to root_path
        else 
            render 'new' #in event it doesn't work, then re-render page 
        #for whitelist, have to whitelist for created object
        end
    end

    def update
        @challenge = Challenge.find(params[:id])
        # using student params to white list
        if @challenge.update(challenge_params)
            flash[:sucess] = "You have successfully update your profile"
            # redirect_to student_path(@student) #this could also be redirect_to @student
            redirect_to root_path
        else
            render 'edit'
        end
    end

    #working on adding totals to challenges
    def add_points
        #@points = 
    end

    private

    def challenge_params
        params.require(:challenge).permit(:name, :challenge_points) #this will whitelist what we receive for the web form, name and email
    end

    def set_challenge
        @challenge = challenge.find(params[:id])
    end

end