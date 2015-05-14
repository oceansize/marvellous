require_relative "../lib/marvel_api"
require "test/unit"

class VCRTest < Test::Unit::TestCase
  def record_comics_endpoint
    VCR.use_cassette("comics") do
      response = MarvelApi.comics
      assert_match(/Example domains/, response.body)
    end
  end
end
