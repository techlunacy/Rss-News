class Article
  include Mongoid::Document
  validates_presence_of :title
  validates_presence_of :url
  validates :url, :url => true
  validates_presence_of :body
  field :title, :type => String
  field :url, :type => String
  field :body, :type => String
end

