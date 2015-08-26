require 'elasticsearch/model'

class Article < ActiveRecord::Base
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    index_name    "vartaa"
    document_type "article"
    self.per_page = 6
end

