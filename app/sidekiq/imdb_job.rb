class ImdbJob
  include Sidekiq::Job

  def perform(*args)
    p 'EHOOOOO'
    p 'EHOOOOO'
    p 'EHOOOOO'
  end
end
