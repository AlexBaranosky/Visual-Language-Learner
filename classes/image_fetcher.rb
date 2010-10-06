require 'json'
require 'open-uri'
require 'cgi'
require 'activesupport'
require File.dirname(__FILE__) + '/image'
require File.dirname(__FILE__) + '/array_extensions'
require File.dirname(__FILE__) + '/enumerable_extensions'

class ImageFetcher
  def initialize(*words)
    @images_by_word = words.to_hash
  end

  def random_image
    word = @images_by_word.keys.pick_randomly
    @images_by_word[word] ||= fetch_images_for(word)
    @images_by_word[word] ? @images_by_word[word].pick_randomly : nil
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
    json = open(url) { |f| f.read }
    json_hash = JSON.parse(json)
    json_hash['responseData']['results'].map do |img|
      Image.new(word, img['tbUrl'], img['unescapedUrl'])
    end
  end
end