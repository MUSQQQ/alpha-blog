module ApplicationHelper

    def current_user    #returns detials of the currently logged user
        if session[:user_id]
            @current_user ||=User.find(session[:user_id])   #that @current_user ||= lets memorize current user if they are actually logged in. that way we dont block db 
    
        end
    end

    def logged_in?
        !!current_user      #!! turns something into bool
    end

end
