class ImdbJob
  include Sidekiq::Job

  def perform(*args)
    GetImdbMovies.new().get_movies
  end
end
