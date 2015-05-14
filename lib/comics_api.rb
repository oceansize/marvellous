require_relative "marvel_api"
require_relative "comic"

class ComicsApi
  def self.all
    MarvelApi.get_from("comics").parsed_response["data"]["results"].map do |comic_data|
      Comic.new(comic_data)
    end
  end
end
