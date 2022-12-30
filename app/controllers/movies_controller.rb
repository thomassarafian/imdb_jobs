class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    # conn = Faraday.new(url: "https://api.themoviedb.org/3/")
    # api_key = ENV["IMDB_KEY"]
    # response = conn.get do |req|
    #   req.url "movie/76341"
    #   req.params["api_key"] = api_key
    # end
    # response_body = JSON.parse(response.body)
    # # Movie.create! title: response_body['original_title'], description: response_body['overview']
  end

  def imdb
    # ImdbJob.perform_async
    conn = Faraday.new(url: "https://api.themoviedb.org/3/")
    api_key = ENV["IMDB_KEY"]
    response = conn.get do |req|
      req.url "movie/76341"
      req.params["api_key"] = api_key
    end
    response_body = JSON.parse(response.body)
    Movie.create! title: response_body['original_title'], description: response_body['overview']
    redirect_to root_path
  end
  
  private
  
  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end
