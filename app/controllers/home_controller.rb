class HomeController < ApplicationController
  IMAGE_FETCHER = ImageFetcher.new('cow', 'cheese', 'goat')

  def index
    @image = IMAGE_FETCHER.random_image
  end
end
