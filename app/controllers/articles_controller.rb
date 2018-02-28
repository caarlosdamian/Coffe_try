class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def new
    end
    def create
        @article = Article.new(parametros)
        if @article.save
            redirect_to @article
        else 
            render 'new'
        end 
    end
  
    def show
   @article = Article.find(params[:id])
    end
    def edit
    @article = Article.find(params[:id])
    end
    def update
        @article =Article.find(params[:id])
        if @article.update(parametros)
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
    def parametros
        params.require(:article).permit(:title,:text)
    end


end
