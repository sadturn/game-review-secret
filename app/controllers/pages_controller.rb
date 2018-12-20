class PagesController < ApplicationController
  def index
    @reviews = Review.all
  end
end
