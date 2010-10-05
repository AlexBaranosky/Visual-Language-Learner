require 'json'

class Array
  def to_hash(values = [])
    Hash[zip(values).flatten]
  end
end

class ImageFetcher
  def initialize(*words)
    @images_by_word = words.to_hash
  end

  def random_image
    word = @images_by_word.keys.pick_randomly
    @images_by_word[word] ||= all(word)
    @images_by_word[word].pick_randomly
  end

  private

  def all(word)
    return [] if word.nil? || word.strip == ''

    url = "http://ajax.googleapis.com/ajax/services/search/images?rsz=large&start=#{position}&v=1.0&q=#{CGI.escape(word)}"
    json_src = open(url) { |f| f.read };
    json = JSON.parse(json_src)
    begin
      images = json['responseData']['results']
      images.map { |img| Image.new(word.titleize, img['tbUrl'], img['unescapedUrl']) }
    rescue
      []
    end
  end

end

module Enumerable
  def pick_randomly
    sort_by { rand }.first
  end
end