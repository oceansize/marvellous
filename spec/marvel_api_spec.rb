require "marvel_api"

describe MarvelApi do

  context "in order to authenticate requests" do

    it "must provide a timestamp as a string" do
      marvel = MarvelApi.new
      expect(marvel.timestamp).to start_with("20")
    end

    it "requires access to a public key" do
      expect(MarvelApi::PUBLIC_KEY).to eq(ENV["MARVEL_PUBLIC_KEY"])
    end
  end
end
