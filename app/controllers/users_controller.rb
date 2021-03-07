class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_user, only: [:sedit, :action]
    before_action :require_correct_user, only: [:edit, :update]
    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            session[:user_id] = @user.id    #user is automatically logged in after signing up
            flash[:notice] = "Welcome #{@user.username}"
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        
        if @user.update(user_params)
            flash[:notice] = "Account updated"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def show
        
        @articles=@user.articles.paginate(page: params[:page], per_page: 5)
    end

    def index
        @users=User.paginate(page: params[:page], per_page: 5)
    end
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user=User.find(params[:id])
    end

    def require_correct_user
        if current_user != @user
            flash[:alert] = "You can't do that"
            redirect_to @user
        end
    end
end
