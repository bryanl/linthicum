class Article < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :user_id
  validates_presence_of :user
  
  belongs_to :user
  
  before_create :slugify_title

  class << self
    def create_with_user(article_options, user)
      create(article_options.merge({:user => user}))
    end
  end
  
  private
  
  def slugify_title
    self.slug ||= PermalinkFu.escape(self.title)    
  end
  
end
