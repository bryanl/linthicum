class ArticleController < ApplicationController
  skip_before_filter :login_required
  
  def index
    @articles = Article.find(:all)
    render :action => "index", :layout => "multi_article"
  end
  
  def show
    @article = Article.find_by_slug(params[:slug])
    render :action => "show", :layout => "single_article"
  end
  
end
