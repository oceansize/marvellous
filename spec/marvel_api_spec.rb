require "marvel_api"
require "spec_helper"

describe MarvelApi do

  context "in order to authenticate requests" do

    let(:md5_signature) { "02b238a7fb81498ba202b238a7fb81498ba2" }

    it "requires a timestamp" do
      marvel = class_double("MarvelApi")

      expect(marvel).to receive(:timestamp).and_return("1431300440")

      marvel.timestamp
    end

    it "requires access to a public key" do
      expect(MarvelApi::PUBLIC_KEY).to eq(ENV["MARVEL_PUBLIC_KEY"])
    end

    it "requires access to a private key" do
      expect(MarvelApi::PRIVATE_KEY).to eq(ENV["MARVEL_PRIVATE_KEY"])
    end

    it "must generate an md5 digest from the timestamp and keys" do
      marvel = class_double("MarvelApi")

      expect(marvel).to receive(:serverside_signature).and_return(md5_signature)

      marvel.serverside_signature("timestamp")
    end
  end

  context "making get requests to an endpoint" do
    it "returns the data" do
      stub_request(:get, /gateway.marvel.com/).to_return(:body => '{"results": []}')

      MarvelApi.get_from('comics')

      expect(WebMock).to have_requested(:get, /public\/comics/)
    end
  end

end
