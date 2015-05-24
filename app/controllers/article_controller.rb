class ArticleController < ApplicationController

  def index
    @article = Article.where(
        "date > ? AND category_id not in (?,?,?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        3, 4, 5, 6, 62, 115, 117
    ).paginate(page: params['page']).order('date DESC')  
  end
  
  def politics
    @article = Article.where(
        "date > ? AND category_id in (?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        31 
    ).paginate(page: params['page']).order('date DESC')  
    render "article/index"
  end

  def business
    @article = Article.where(
        "date > ? AND category_id in (?,?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        30, 32, 33, 38, 59, 63 
    ).paginate(page: params['page']).order('date DESC')  
    render "article/index"
  end

  def oped
    @article = Article.where(
        "date > ? AND category_id in (?,?,?,?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        8, 9, 37, 74, 89, 112, 117, 120
    ).paginate(page: params['page']).order('date DESC')  
    render "article/index"
  end

  def sports
    @article = Article.where(
        "date > ? AND category_id in (?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        10, 57, 64, 70
    ).paginate(page: params['page']).order('date DESC')  
    render "article/index"
  end

  def ent
    @article = Article.where(
        "date > ? AND category_id in (?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        6, 99, 100, 101, 105
    ).paginate(page: params['page']).order('date DESC')  
    render "article/index"
  end

  def show
  	@title = Article.where(id: params["id"]).pluck('title')
    @content = Content.where(id: params["id"]).pluck('content')
  end

end
