class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    # dla wybranych metod wywoluje przed ich rozpoczeciem wskazana metode

    def show
        #instance variable down below
        #byebug
         #przypisuje zmiennej article o danym id(wprowadzonym w przegladarce)
    end

    def index
        @articles = Article.all
    end

    def new
        if !@article.presence   #moja wlasna wersja. Niby dziala bez if ale z ifem jest pewnosc ze @article nie bedzie nadpisywany
        @article = Article.new
        end
    end

    def create
        @article = Article.new(article_params)
        @article.user=User.first
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

end