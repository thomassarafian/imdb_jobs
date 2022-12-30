class GetImdbMovies 
  def initialize
  end

  def get_movies
    conn = Faraday.new(url: "https://api.themoviedb.org/3/")
    api_key = ENV["IMDB_KEY"]
    response = conn.get do |req|
      req.url "movie/76341"
      req.params["api_key"] = api_key
    end
    response_body = JSON.parse(response.body)
    Movie.create! title: response_body['original_title'], description: response_body['overview']
  end
end
