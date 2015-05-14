require "comics_api"
require "spec_helper"
#require_relative "fixtures/comics_fixture"

describe ComicsApi do

  it "retrieves an empty list of all comics" do
    result = double(:result, parsed_response: {"data" => {"results" => []}})
    allow(MarvelApi).to receive(:get_from).with("comics").and_return(result)

    expect(ComicsApi.all).to eq([])
  end

  it "retrieves a list of comics" do
    comics = [{"id" => 1, "title" => "Ant-Man"}]
    result = double(:result, parsed_response: {"data" => {"results" => comics}})
    allow(MarvelApi).to receive(:get_from).with("comics").and_return(result)

    comic = Comic.new(comics.first)

    expect(ComicsApi.all).to eq([comic])

  end

end
