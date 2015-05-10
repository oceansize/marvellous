require "httparty"

class MarvelApi

  include HTTParty

  base_uri "http://gateway.marvel.com/v1/public"
  format :json

  PUBLIC_KEY  = ENV["MARVEL_PUBLIC_KEY"]
  PRIVATE_KEY = ENV["MARVEL_PRIVATE_KEY"]

  class << self
    def timestamp
      Time.now.to_i.to_s
    end

    def serverside_signature(timestamp)
      Digest::MD5.hexdigest(timestamp + PRIVATE_KEY + PUBLIC_KEY)
    end

    def comics
      get("/comics", query: {
        ts: timestamp,
        apikey: PUBLIC_KEY,
        hash: serverside_signature(timestamp)
      })
    end
  end
end
