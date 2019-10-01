module ApplicationHelper

    def session_link
        if (logged_in?)
            link_to "logout", logout_path, method: :delete # only need to declare method for delete 
        else 
            link_to "login", login_path 
        end 
    end 
end
