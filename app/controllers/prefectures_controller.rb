class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
    @grouped_by_region_prefectures = @prefectures.group_by {|r| [r[:region]] }
  end
  
  def show
    @prefecture = Prefecture.find(params[:id])
  end
end
