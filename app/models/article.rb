require 'elasticsearch/model'

class Article < ActiveRecord::Base
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    self.per_page = 8
end

