class ToppagesController < ApplicationController
  def index
    if logged_in?
      redirect_to search_url
    end
  end
end
