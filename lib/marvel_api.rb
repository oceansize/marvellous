class MarvelApi

  PUBLIC_KEY = ENV["MARVEL_PUBLIC_KEY"]

  def timestamp
    Time.now.to_s.gsub(" ","-")
  end
end
