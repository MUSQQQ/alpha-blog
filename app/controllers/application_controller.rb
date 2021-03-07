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

    helper_method :require_user
    def require_user #method used to restrict actions at the controller level (so they arent accesible just by changing the URL)
        if !logged_in?
            flash[:alert] = "You must be logged in first"
            redirect_to login_path
        end
    end
end
