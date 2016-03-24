class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @games = []
      @characters = []
    else
      @games = Game.search params[:q]
      @characters = Character.search params[:q]
    end
  end
end
