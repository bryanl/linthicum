require File.dirname(__FILE__) + '/../spec_helper'

describe Article do

  describe "at creation" do

    it "should require a user" do
      lambda {
        ArticleFactory.create_normal :user => nil
      }.should_not change(Article, :count)
    end

    it "should require a title" do
      lambda {
        ArticleFactory.create_normal :title => nil
      }.should_not change(Article, :count)
    end
    
    it "should generate a slug using the title before creating" do
      article = ArticleFactory.create_normal :title => "Another new article"
      article.slug.should == "another-new-article"
    end

  end
  
  describe "in general" do
    
    it "should be able to create an article with a user" do
      user = UserFactory.create_normal
      article_options = {:title => "title", :body => "body"}
      article = Article.create_with_user(article_options, user)
      article.user.should == user
    end
    
  end
  
end
