class PagesController < ApplicationController
  def home
  end
  
  def imdb
    ImdbJob.perform_async
  end
end
