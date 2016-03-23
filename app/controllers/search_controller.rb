class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @games = []
      @characters = []
      @moves = []
    else
      @games = Game.search params[:q]
      @characters = Character.search params[:q]
      @moves = Move.search params[:q]
    end
  end
end
