class ArticlesController < ApplicationController
    # before_action automatically performs chosen method before specified methods
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_correct_user, only: [:edit, :update, :destroy]
    def show
        
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5) #in place of "Article.all" to use pagination feature added with pagination gemfile
    end

    def new
        if !@article.presence   #my own version to be sure that @article isnt getting overwritten
        @article = Article.new
        end
    end

    def create
        @article = Article.new(article_params)
        @article.user=current_user
        if @article.save
            flash[:notice] = "article was created succesfully"
            redirect_to article_path(@article)
        else
            render 'new'
        end
        #render plain: @article.inspect
    end
    
    def edit
        
    end

    def update
        
        if @article.update(article_params)
            flash[:notice] = "Article was edited succesfully"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        
        @article.destroy
        redirect_to articles_path
    end
    
    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

    def require_correct_user
        if current_user != @article.user && !current_user.admin?
            flash[:alert] = "You can't do that"
            redirect_to @article
        end
    end
end