class ArticleController < ApplicationController

  def index
  	@article = Article.paginate(page: params['page'])  
  end
  def show
  	@title = Article.where(id: params["id"]).pluck('title')
    @content = Content.where(id: params["id"]).pluck('content')
  end
end
