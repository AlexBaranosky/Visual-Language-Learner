require 'json'
require 'open-uri'

class Array
  def to_hash(values = [])
    Hash[*self.zip(values).flatten]
  end
end

class ImageFetcher
  def initialize(*words)
    @images_by_word = words.to_hash
  end

  def random_image
    puts "images by word: #{@images_by_word}"
    word = @images_by_word.keys.pick_randomly
    @images_by_word[word] ||= fetch_images_for(word) # why's this not working as I want?
    @images_by_word[word].pick_randomly
  end

  private

  def fetch_images_for(word)
    return nil if word.nil? || word.strip == ''
    begin
      images_from_google(word)
    rescue
      nil
    end
  end

  def images_from_google(word)
    url = "http://ajax.googleapis.com/ajax/services/search/images?rsz=large&start=0&v=1.0&q=#{CGI.escape(word)}"
    json_src = open(url) { |f| f.read }
    json = JSON.parse(json_src)
    json['responseData']['results'].map do |img|
      FlashCardImage.new(word.titleize, img['tbUrl'], img['unescapedUrl'])
    end
  end
end

module Enumerable
  def pick_randomly
    sort_by { rand }.first
  end
end