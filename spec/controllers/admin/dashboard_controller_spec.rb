require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::DashboardController do

  describe "requesting /admin/ using GET (not logged in)" do

    def do_get
      get :index
    end  

    it "should redirect to /login" do
      do_get
      response.should redirect_to(admin_login_path)
    end

  end

  describe "requesting /admin/ using GET" do
    fixtures :users

    before(:each) do
      login_as :quentin
      @articles = [mock_model(Article)]    
    end  

    def do_get
      get :index
    end  

    it "should render with no errors" do
      do_get
      response.should be_success
    end

    it "should assign a list of articles" do
      Article.should_receive(:find).with(:all).and_return(@articles)
      do_get
      assigns[:articles].should == @articles
    end

  end

end