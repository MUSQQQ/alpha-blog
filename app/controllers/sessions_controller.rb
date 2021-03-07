class SessionsController < ApplicationController

    def new
    end

    def create
        user=User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id # allows logged in users to stay signed in | Also user data is stored on the client side and encrypted
            flash[:notice] = "You are now logged in"
            redirect_to user
        else
            flash.now[:alert] = "Wrong login details"   #flash.now doesnt last for a whole http request so it will dissapear after changing path
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You are now logged out"
        redirect_to root_path
    end

end
