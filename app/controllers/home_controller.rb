class HomeController < ApplicationController
  def index
    @jobs = Job.includes(:company, :tags).all
    @tags = Tag.all
    @prefectures = Prefecture.all
    @articles = Article.includes(:article_specific_tags).order(published_at: :desc)
  end
end
