class GamesController < ApplicationController
  before_action :find_game, only: [:edit, :update, :destroy]
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path
    else
      render 'new'
    end
  end

  def index
    @games = Game.all
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to games_path
    else
      render 'edit'
    end
  end

  def destroy
    @game.destroy

    redirect_to games_path
  end

  private
    def find_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:title)
    end

end
