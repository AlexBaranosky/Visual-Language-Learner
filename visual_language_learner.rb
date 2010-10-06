require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'haml'
require File.dirname(__FILE__) + '/classes/enumerable_extensions'
require File.dirname(__FILE__) + '/classes/image_fetcher'

class VisualLanguageLearner < Sinatra::Base
  get '/' do
    haml :index
  end

  post '/image' do
    words = params[:words].strip.split(/\s+/)
    @image = ImageFetcher.new(*words).random_image
    haml :image
  end
end

