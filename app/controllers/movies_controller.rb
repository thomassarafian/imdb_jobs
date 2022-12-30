class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def imdb
    # ImdbJob.perform_async
    GetImdbMovies.new().get_movies
    redirect_to root_path
  end
end
