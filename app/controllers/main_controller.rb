class MainController < ApplicationController
  def index
    @articles = Article.find(:all, :limit => 3, :order=> 'created_at desc');
  end
end
