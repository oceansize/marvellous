require "marvel_api"

describe MarvelApi do

  context "in order to authenticate requests" do

    let(:md5_signature) { "02b238a7fb81498ba202b238a7fb81498ba2" }

    it "requires a timestamp generated as a string" do
      marvel = MarvelApi.new

      expect(marvel.timestamp).to start_with("20")
    end

    it "requires access to a public key" do
      expect(MarvelApi::PUBLIC_KEY).to eq(ENV["MARVEL_PUBLIC_KEY"])
    end

    it "requires access to a private key" do
      expect(MarvelApi::PRIVATE_KEY).to eq(ENV["MARVEL_PRIVATE_KEY"])
    end

    it "must generate an md5 digest from the timestamp and keys" do
      marvel = instance_double("MarvelApi")

      expect(marvel).to receive(:serverside_signature).and_return(md5_signature)

      marvel.serverside_signature
    end
  end
end
