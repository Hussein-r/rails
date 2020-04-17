class ArticlesController < ApplicationController
    # display all articles
    def index
        @articles = Article.all
    end
    # list a specific article
    def show
        @article = Article.find(params[:id])
    end
    
    # go to new article html
    def new
        @article = Article.new
    end
    
    # go to database and create new article row
    def create
        @article = Article.new(article_params)
        
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    # render edit page with a specific article
    def edit
        @article = Article.find(params[:id])
    end
       
    # update action 
    def update
        @article = Article.find(params[:id])
    
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
       
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
