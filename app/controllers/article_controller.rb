class ArticleController < ApplicationController

  def index
    @article = Article.where(
        "date > ? AND category_id not in (?,?,?,?,?,?,?)", 
        Date.today.prev_day.to_formatted_s(:db),
        3, 4, 5, 6, 62, 115, 117 
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.page_rank') 
  end
  
  def politics
    @article = Article.where(
        "date > ? AND category_id in (?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        31 
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.page_rank')  
    render "article/index"
  end

  def business
    @article = Article.where(
        "date > ? AND category_id in (?,?,?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        30, 32, 33, 38, 59, 63, 138
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.page_rank')  
    render "article/index"
  end

  def oped
    @article = Article.where(
        "date > ? AND category_id in (?,?,?,?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        8, 9, 37, 74, 89, 112, 117, 120
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.page_rank')  
    render "article/index"
  end

  def sports
    @article = Article.where(
        "date > ? AND category_id in (?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        10, 57, 64, 70, 73
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.page_rank')  
    render "article/index"
  end

  def ent
    @article = Article.where(
        "date > ? AND category_id in (?,?,?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        6, 99, 100, 101, 105, 129, 135
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.page_rank')  
    render "article/index"
  end

  def show
    article = Article.where(id: params["id"])
  	@title = article.pluck('title')
    @title[0] = HTMLEntities.new.decode @title[0]
  	@date = article.pluck('date')
  	@url = article.pluck('url')
    id = article.pluck('source_id')
    @content = Content.where(id: params["id"]).pluck('content')
    @content[0] = HTMLEntities.new.decode @content[0]
    @source = Source.where(id: id).pluck('name')
    @aut_ids = article.pluck('author_ids')
    @authors = ''
    if @aut_ids.size > 0
        @authors = Author.where("id in (?)", @aut_ids[0].split(',')).pluck('name')
        @authors = [ @authors.join(", ") ]
    end
  end

end
