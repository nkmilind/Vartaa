class ArticleController < ApplicationController

  def index
    
  	@article = Article.where(
        "date > ? ", Date.today.prev_day.prev_day.to_formatted_s(:db) 
    ).paginate(page: params['page']).order('date DESC')  

  end
  def show
  	@title = Article.where(id: params["id"]).pluck('title')
    @content = Content.where(id: params["id"]).pluck('content')
  end
end
