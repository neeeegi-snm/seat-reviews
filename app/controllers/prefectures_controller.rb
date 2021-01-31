class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
    @grouped_by_region_prefectures = @prefectures.group_by {|r| [r[:region]] }
  end
  
  def show
    @prefecture = Prefecture.find(params[:id])
    @q = @prefecture.reviews.ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @reviews = @q.result(distinct: true).page(params[:page]).per(5)
  end
end
