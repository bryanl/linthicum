require File.dirname(__FILE__) + '/../spec_helper'

describe ArticleController do

  describe "route recognition" do    
    it "should recognize article URLs (/2008/05/12/article-slug)" do
      params = {:controller => "article", :action => "show", :slug => "article-slug", :year => "2008", :month => "05", :day => "12"}
      params_from(:get, "/2008/05/12/article-slug").should == params
    end    
  end
  
  describe "GET on /" do
    
    def do_get
      get :index
    end
    
    before(:each) do
      @articles = mock("articles")
      Article.should_receive(:find).with(:all).and_return(@articles)
    end
    
    it "should render the home page successfully" do
      do_get
      response.should_not be_error
    end
    
    it "should assign all articles" do
      do_get
      assigns[:articles].should == @articles
    end
        
  end
  
  describe "GET on /show (article exists)" do
    def do_get
      get :show, {:slug => "article-slug", :year => "2008", :month => "05", :day => "12"}
    end
    
    before(:each) do
      @article = mock_model(Article)
    end
    
    it "should load the article using it's slug" do
      Article.should_receive(:find_by_slug).with("article-slug").and_return(@article)
      do_get
    end
    
    it "should render the article successfully" do
      do_get
      response.should_not be_error
    end
  end

end
