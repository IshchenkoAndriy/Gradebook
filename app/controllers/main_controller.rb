class MainController < ApplicationController
  def index
    @articles = Article.order('created_at desc').limit(6).all
  end
  
end
