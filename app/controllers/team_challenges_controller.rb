class TeamChallengesController < ApplicationController 
    def create
        challenge_to_add = Challenge.find(params[:challenge_id]) #find the challenge bases on challenge we are sending in
        unless current_user.challenges.include?(challenge_to_add)#create association only ifcurrent user isnt already enrolled in couse
            #i think this is just creating the relationship.
            TeamChallenge.create(challenge: challenge_to_add, team: current_user)#rails will extract id from here and use to in the association
            #create will hit the db directly


            #how to add point total?
            #do I need to find the challenge.team, which doesn't exist?
            #team = challenge.find(params[:team_id]) #do I need to create :team_id? it does not exist

            #current users challenge,
            #current_user.challenges.team_id 

            #table is score, score.team_score stores the points, and team_id: 1 is team_one and team_id: 2 is team_two
            #probably need to use .update()
            #team = Team.find(params[:team_id])
            #team = Team.find(2)
            #test = team.scores.find(2).team_score #hard coding to test. now do I save or just write this correctly?
            #can also access with team = Team.find(2).scores.find(2).team_score
            # test = test + 1
            # puts test

            points = challenge.find(params[:challenge_id])
            points = points.challenge_points

            #current_team_two_score = Team.find(2).scores.find(2).team_score #manual hard code, this works
            puts current_user.id, "*******************"
            #puts Team.find(current_user.id).scores.find(1).team_score, 'Team.find(current_user.id).scores.find(1).team_score '
            #here is where it fails rd::RecordNotFound (Couldn't find Score with 'id'=1 [WHERE "scores"."team_id" = $1]):
            current_team_two_score = Team.find(current_user.id).scores.find(current_user.id).team_score  #unsure if current_user.id is correct - i might just be passing in the user id, and not the team id
            Score.update(current_user.id, team_score: (current_team_two_score + points)) #unsure if current_user.id is correct - i might just be passing in the user id, and not the team id


            flash[:notice] = "You have completed #{challenge_to_add.name}!"
            redirect_to root_path
        else  
            flash[:notice] = "Something was wrong with the score update"
            redirect_to root_path
        end
    end

    # def destroy
    #     challenge_to_remove = challenge.find(params[:challenge_id]) #here the challenge is 7
    #     unless !current_user.challenges.include?(challenge_to_remove)
            
    #         #test = challenge_to_remove.team_challenge.find(current_user.id) #(challenge.id = 7).teamchallenge.find(team_id = 1)
    #         test = challenge_to_remove.team_challenges.find(current_user.id)
    #         test.destroy

    #         points = challenge.find(params[:challenge_id])
    #         points = points.challenge_points

    #         #current_team_two_score = Team.find(2).scores.find(2).team_score #manual hard code, this works
    #         #puts current_user.id, "*******************"
    #         #puts Team.find(current_user.id).scores.find(1).team_score, 'Team.find(current_user.id).scores.find(1).team_score '
    #         #here is where it fails rd::RecordNotFound (Couldn't find Score with 'id'=1 [WHERE "scores"."team_id" = $1]):
    #         current_score = Team.find(current_user.id).scores.find(current_user.id).team_score  #unsure if current_user.id is correct - i might just be passing in the user id, and not the team id
    #         Score.update(current_user.id, team_score: (current_score - points)) #unsure if current_user.id is correct - i might just be passing in the user id, and not the team id


    #         flash[:notice] = "You have uncompleted #{challenge_to_add.name}!"
    #         redirect_to root_path
    #     else  
    #         flash[:notice] = "Something was wrong with the score update"
    #         redirect_to root_path
    #     end
    # end
end