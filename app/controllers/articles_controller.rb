class ArticlesController < ApplicationController

    def show
        #instance variable down below
        #byebug
        @article = Article.find(params[:id]) #przypisuje zmiennej article o danym id(wprowadzonym w przegladarce)
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
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "article was created succesfully"
            redirect_to article_path(@article)
        else
            render 'new'
        end
        #render plain: @article.inspect
    end


end