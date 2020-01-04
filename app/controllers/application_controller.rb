class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    #this is application controller. so any restrictions will be inherited in all other controllers
    before_action :require_user

    helper_method :current_user, :logged_in?
    def current_user #in a method so we can always refer to a current user 
        @current_user ||= Team.find(session[:team_id]) if session[:team_id] # ifthis is set, then it finds team from session hash ifsession :team_id and assign it to @current_user. now there is a logged in user 
        #|| arefor memoization. the team query will only be performed ifthe @current_user does not exist
    end

    def logged_in?
        !!current_user #!! will return true or false, so returning current_user is true or false
    end

    def require_user #enforce pages and actions that require a (logged in) user
        if !logged_in? #ifnot logged in
            flash[:notice] = "You must be logged in to perform that action"
        redirect_to login_path#then redirect
        end
    end

    # def download_pdf
    #     send_data "univ_app/public/file.txt", type: "application/txt", x_sendfile: true
    # end 

    def admin #i think I should get rid of this, and add this to the current_user as an if 
        puts current_user, 'is the current user ###############################################'
        if current_user.name = 'admin'
        @admin = current_user
        end
    end

end
