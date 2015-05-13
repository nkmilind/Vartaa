class ArticleController < ApplicationController

  def index
  	@article = Article.take(6)  
  end
  def show
  	@title = Article.where(id: params["id"]).pluck('title')
    @content = Content.where(id: params["id"]).pluck('content')
  end
end
