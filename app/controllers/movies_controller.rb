class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  def imdb
    # ImdbJob.perform_at(1.seconds)
    # conn = Faraday.new(url: "https://api.themoviedb.org/3/")
    # api_key = ENV["IMDB_KEY"]
    # response = conn.get do |req|
    #   req.url "movie/157336"
    #   req.params["api_key"] = api_key
    # end
    # p response
    # response_body = JSON.parse(response.body)
    # if response.status == 200
    #   Movie.create! title: response_body['original_title'], description: response_body['overview']
    # else
    #   p response_body['status_message']
    # end
    # redirect_to '/'
  end

end
