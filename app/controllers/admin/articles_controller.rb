class Admin::ArticlesController < ApplicationController

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.create_with_user(params[:article], current_user)
    if @article.save
      redirect_to(:controller => "admin/dashboard")      
    else
      render :action => "new"
    end
  end
  
end
