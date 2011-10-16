class Feed
  include Mongoid::Document
  field :title, :type => String
  field :url, :type => String
  field :feed_url, :type => String
  field :etag, :type => String
  field :last_modified, :type => Time
end
