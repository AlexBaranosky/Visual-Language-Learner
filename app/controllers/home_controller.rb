class HomeController < ApplicationController
  def index
    @image_names = ImageFetcher.new('cow', 'cheese', 'goat').random_image.map { |i| i.name }
  end
end
