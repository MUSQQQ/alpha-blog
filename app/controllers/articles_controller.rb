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

    end

    def create
        #render plain: params[:article]
    end


end