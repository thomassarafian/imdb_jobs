class GetImdbMovies 
  def initialize
  end

  def get_movies
    # begin
      conn = Faraday.new(url: "https://api.themoviedb.org/3/")
      api_key = ENV["IMDB_KEY"]
      response = conn.get do |req|
        req.url "movie/157336"
        req.params["api_key"] = api_key
      end
      p response
      response_body = JSON.parse(response.body)
      if response.status == 200
        Movie.broadcast_create title: response_body['original_title'], description: response_body['overview']
      else
        p response_body['status_message']
      end
    # rescue StandardError => e
      # p "An error occurred: #{e.message}"
    # end
  end
end
