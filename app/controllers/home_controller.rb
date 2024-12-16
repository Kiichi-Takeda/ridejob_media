class HomeController < ApplicationController
  def index
    @jobs = Job.includes(:company, :tags).all
    @tags = Tag.all
    @prefectures = Prefecture.all
  end
end
