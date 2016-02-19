class MovesController < ApplicationController
  before_action :find_game
  before_action :find_character
  before_action :find_move, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:create, :edit, :update, :destroy]

  def create
    @move = @character.moves.create(move_params)
    redirect_to game_character_path(@game, @character)
  end

  def show
  end

  def edit
  end

  def update
    if @move.update(move_params)
      redirect_to game_character_path(@game, @character)
    else
      render 'edit'
    end
  end

  def destroy
    @move.destroy
    redirect_to game_character_path(@game, @character)
  end  

  private
    def find_game
      @game = Game.find(params[:game_id])
    end

    def find_character
      @character = Character.find(params[:character_id])
    end

    def find_move
      @move = @character.moves.find(params[:id])
    end

    def move_params
      params.require(:move).permit(:name, :input)
    end
end
