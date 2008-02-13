require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::ArticlesController do
  fixtures :users
  
  before(:each) do
    login_as(:quentin)
  end
  
  describe "GET on /admin/articles/new" do
    
    before(:each) do
      @article = mock("article")
      Article.stub!(:new).and_return(@article)
    end
    
    def do_get
      get :new
    end
    
    it "should assign a new empty article" do
      do_get
      assigns[:article].should == @article
    end
    
  end

  describe "POST on /admin/articles" do
    def do_post(options)
      post :create, :article => options
    end
    
    describe "(when successful)" do
      
      before(:each) do
        @article_options = {:title => "title", :body => "body"}
        @article = mock_model(Article, {:save => true})
        Article.stub!(:create).and_return(@article)
      end
      
      it "should redirect to the dashboard" do
        do_post(@article_options)
        response.should redirect_to(:controller => "admin/dashboard")
      end
      
      it "should create a new article" do
        @article.should_receive(:save).and_return(true)
        do_post(@article_options)
      end
      
    end
    
    describe "(when unsuccessful)" do
      
      before(:each) do
        @article_options = {:title => "", :body => ""}
        @article = mock_model(Article, {:save => false})
        Article.stub!(:new).and_return(@article)        
      end
      
      it "should render the new article form" do
        do_post(@article_options)
        response.should render_template("new")
      end
      
    end
  end
  
end