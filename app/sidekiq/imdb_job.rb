class ImdbJob
  include Sidekiq::Job

  def perform(*args)
    conn = Faraday.new(url: "https://api.themoviedb.org/3/")
    api_key = ENV["IMDB_KEY"]
    response = conn.get do |req|
      req.url "movie/76341"
      req.params["api_key"] = api_key
    end
    response_body = JSON.parse(response.body)
    p response_body['original_title']
  end
end
