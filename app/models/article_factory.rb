class ArticleFactory
  class << self
    def create_normal(options = {})
      defaults = {
        :title => "an article title",
        :body => "here is some stuff",
        :user => UserFactory.create_normal
      }.merge(options)
      Article.create(defaults)
    end
    
    def create_multiple(count = 1, options = {})
      articles = []
      count.times do |x|
        options.merge!({
          :title => "article title: #{x}",
        })
        
        articles << self.create_normal(options)
      end
      articles
    end
  end
end

