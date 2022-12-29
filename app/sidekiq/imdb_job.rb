require 'imdb'

class ImdbJob
  include Sidekiq::Job

  def perform(*args)
    p 'BEFORE IMDB'
    search = Imdb::Search.new("The Godfather")
    p search.movies.first.title
    p 'AFTER IMDB'
  end
end
