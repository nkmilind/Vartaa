# ENV['ELASTICSEARCH_ADDRESS_INT'] is the environment variable 
# for the elasticsearch server, replace with IP address if not using ENV
Article.__elasticsearch__.client = Elasticsearch::Client.new host: '207.181.217.150'
