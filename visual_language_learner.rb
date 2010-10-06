require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require File.dirname(__FILE__) + '/classes/enumerable_extensions'
require File.dirname(__FILE__) + '/classes/image_fetcher'

class VisualLanguageLearner < Sinatra::Base
  get '/' do
    @image = nil
    erb :index
  end

  post '/image' do
    words = params[:words].strip.split(/\s+/)
    @image = ImageFetcher.new(*words).random_image
    erb :image
  end
end

VisualLanguageLearner.run!