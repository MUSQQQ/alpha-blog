class ApplicationController < ActionController::Base

    helper_method :current_user #current_user is now available also to for example views, not only controllers

    def current_user    #returns detials of the currently logged user   || its a helper method
        if session[:user_id]
            @current_user ||=User.find(session[:user_id])   #that @current_user ||= lets memorize current user if they are actually logged in. that way we dont block db 
    
        end
    end

    helper_method :logged_in?
    def logged_in?
        !!current_user      #!! turns something into bool
    end
end
