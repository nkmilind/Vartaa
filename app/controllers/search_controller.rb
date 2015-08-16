class SearchController < ApplicationController
    skip_before_filter :auth, only: [:search]
    def search
        if params[:q].nil?
            @articles = []
        else
            @articles = Article.search query:     { match:  { title: "Modi" } }
            logger.info @articles
            #@articles = Article.search params[:q]
        end
    end
end
