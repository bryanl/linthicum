require "rubygems"
require "hpricot"

steps_for :article do
  
  Given "a test article titled \"$title\" created on $date" do |title, date|
    article_options = {
      :title => title,
      :body => "test article",
      :user => UserFactory.create_normal
    }
    
    article = ArticleFactory.create_normal(article_options)    
    article.should be_valid
  end 

  When "I visit $path" do |path|
    get path
    response.should_not be_error
  end

  Then "the page should have text \"$text\"" do |text|
    response.should be_success
    response.should have_text(/#{text}/)
  end
  
  Then "the page should have $count articles" do |count|
    doc = Hpricot(response.body)
    doc.search(".article").size.should == count.to_i
  end
  
   
end