class SearchController < ApplicationController
    skip_before_filter :auth, only: [:search]
    def search
        if params[:q].nil?
            @articles = []
        else
            
            @articles = Article.search(
                query: {
                    simple_query_string: {  
                        query: params[:q], 
                        analyzer: 'snowball', 
                        fields: [ '_all'] , 
                        default_operator: 'or'
                    } 
                },
                sort: {
                    date:   { order: "desc" },
                    _score: { order: "desc" }
                } 
            ).paginate(page: params['page'] || 1, per_page: 20)
        end
    end
end
