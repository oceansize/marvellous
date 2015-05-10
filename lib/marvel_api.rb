class MarvelApi

  PUBLIC_KEY  = ENV["MARVEL_PUBLIC_KEY"]
  PRIVATE_KEY = ENV["MARVEL_PRIVATE_KEY"]

  def timestamp
    Time.now.to_s.gsub(" ","-")
  end

  def serverside_signature
    timestamp + PRIVATE_KEY + PUBLIC_KEY
  end
end
