class ArticleController < ApplicationController
  skip_before_filter :auth, only: [:show, :index, :politics, :business, :oped, :sports, :ent, :like, :dislike]
  def index
    @latest = Article.select('title').where(
        "date >= ? AND category_id not in (?,?,?,?,?,?,?)", 
        Date.today.prev_day.to_formatted_s(:db),
        3, 4, 5, 6, 62, 115, 117 
    ).joins(' JOIN ranking on ranking.id = article.id').order('ranking.page_rank').limit(50) 

    @article = Article.select('*, ranking.admin, ranking.likes, ranking.dislikes').where(
        "date >= ? AND category_id not in (?,?,?,?,?,?,?)", 
        Date.today.prev_day.to_formatted_s(:db),
        3, 4, 5, 6, 62, 115, 117 
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.admin', 'ranking.page_rank') 
    respond_to do |format|
      format.html
      format.js
    end
  end

  def politics
    @article = Article.select('*, ranking.admin, ranking.likes, ranking.dislikes').where(
        "date >= ? AND category_id in (?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        31, 168 
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.admin', 'ranking.page_rank')  
    render "article/index"
  end

  def business
    @article = Article.select('*, ranking.admin, ranking.likes, ranking.dislikes').where(
        "date >= ? AND category_id in (?,?,?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        30, 32, 33, 38, 59, 63, 138
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.admin', 'ranking.page_rank')  
    render "article/index"
  end

  def oped
    @article = Article.select('*, ranking.admin, ranking.likes, ranking.dislikes').where(
        "date >= ? AND category_id in (?,?,?,?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        8, 9, 37, 74, 89, 112, 117, 120
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.admin', 'ranking.page_rank')  
    render "article/index"
  end

  def sports
    @article = Article.select('*, ranking.admin, ranking.likes, ranking.dislikes').where(
        "date >= ? AND category_id in (?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        10, 57, 64, 70, 73
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.admin', 'ranking.page_rank')  
    render "article/index"
  end

  def ent
    @article = Article.select('*, ranking.admin, ranking.likes, ranking.dislikes').where(
        "date >= ? AND category_id in (?,?,?,?,?,?,?,?,?)", 
        Date.today.prev_day.prev_day.to_formatted_s(:db),
        6, 99, 100, 101, 105, 124, 129, 135, 148
    ).joins(' JOIN ranking on ranking.id = article.id').paginate(page: params['page']).order('ranking.admin', 'ranking.page_rank')  
    render "article/index"
  end

  def show
    article = Article.where(id: params["id"])
    rank = Ranking.where(id: params["id"])
    @def_rank = rank.pluck('admin')
    @title = article.pluck('title')
    @title[0] = HTMLEntities.new.decode @title[0]
    @date = article.pluck('date')
    @url = article.pluck('url')
    @my_id = params["id"]
    @photo_url = article.pluck('photo_url')
    id = article.pluck('source_id')
    @content = Content.where(id: params["id"]).pluck('content')
    @content[0] = HTMLEntities.new.decode @content[0]
    @source = Source.where(id: id).pluck('name')
    @source_id = article.pluck('source_id')
    @aut_ids = article.pluck('author_ids')
    @authors = ''
    if @aut_ids.size > 0
        @authors = Author.where("id in (?)", @aut_ids[0].split(',')).pluck('name')
        @authors = [ @authors.join(", ") ]
    end
    @comments = Comments.select('"user".name as name, comments.comment as comment').where(article_id: params["id"] ).joins(' JOIN "user" on "user".id = comments.user_id').order('comments.created_date')
    if current_user
        u_like = Userlikes.find_by(
            article_id: params["id"], 
            user_id: current_user.id
        )
        if u_like
           @likes = u_like.likes
        end
    end
  end

  def rank
    Ranking.where(id: params["id"]).update_all(admin: params["rank"])
    redirect_to :back
  end

  def like
    if current_user
        u_likes = Userlikes.find_by(article_id: params["id"], user_id: current_user.id )
        if u_likes.nil?  
           Userlikes.create(user_id: current_user.id, likes: 1, article_id: params["id"])  
        else
            Userlikes.where(article_id: params["id"], user_id: current_user.id ).update_all(likes: 1)
        end
        likes = Userlikes.where(article_id: params["id"], likes: 1).count()
        dislikes = Userlikes.where(article_id: params["id"], likes: 0).count()
        Ranking.where(id: params["id"]).update_all(likes: likes, dislikes: dislikes)
        redirect_to :back
    else
        flash[:notice1] = "You need to be signed in to like"
        redirect_to :back
    end 
  end

  def dislike
    if current_user
        u_likes = Userlikes.find_by(article_id: params["id"], user_id: current_user.id )
        if u_likes.nil?  
           Userlikes.create(user_id: current_user.id, likes: 0, article_id: params["id"])  
        else 
            Userlikes.where(article_id: params["id"], user_id: current_user.id ).update_all(likes: 0)
        end
        dislikes = Userlikes.where(article_id: params["id"], likes: 0).count()
        likes = Userlikes.where(article_id: params["id"], likes: 1).count()
        Ranking.where(id: params["id"]).update_all(dislikes: dislikes, likes: likes)
        redirect_to :back
    else
        flash[:notice1] = "You need to be signed in to dislike"
        redirect_to :back
    end
  end

  def comment
    Comments.create(
        user_id: current_user.id, 
        article_id: params["id"],
        comment: params[:req]["name"],
        created_date: Time.now.getutc(),
        updated_date: Time.now.getutc(),
    )

    redirect_to :back
  end

end
