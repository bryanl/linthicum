class Admin::DashboardController < ApplicationController
  
  def index
    @articles = Article.find(:all)
  end
  
end
