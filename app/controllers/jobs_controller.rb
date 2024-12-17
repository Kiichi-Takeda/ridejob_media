class JobsController < ApplicationController
  def index
    @prefectures = Prefecture.all # 都道府県一覧を取得
    @tags = Tag.all # こだわり条件一覧を取得
    @jobs = Job.all

    # 都道府県で検索
    if params[:prefecture].present?
      @jobs = @jobs.where(location: params[:prefecture])
    end

    # こだわり条件で検索
    if params[:conditions].present?
      @jobs = @jobs = @jobs.joins(:tags).where(tags: { name: params[:conditions] }).distinct
    end
  end
  def show
    @job = Job.find(params[:id])
  end
end
