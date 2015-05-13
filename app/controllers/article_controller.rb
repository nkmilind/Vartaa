class ArticleController < ApplicationController

  def index
  	@article = Article.take(6)  
  end
  def show
  	article = {
        title: Article.find_by(id: params["id"]),
        content: Content.find_by(id: params["id"]) 
    }
  end
end
