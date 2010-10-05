class WordsController < ApplicationController
  def new
    @words = Words.new(params[:words])
  end

  def index

  end

  def create

  end
end
