class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @games = []
    else
      @games = Game.search params[:q]
    end
  end
end
