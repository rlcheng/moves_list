class MovesController < ApplicationController
  before_action :authorize, only: [:new, :edit, :update, :destroy]

  def create
    @game = Game.find(params[:game_id])
    @character = Character.find(params[:character_id])
    @move = @character.moves.create(move_params)
    redirect_to game_character_path(@game, @character)
  end

  def show
    @game = Game.find(params[:game_id])
    @character = Character.find(params[:character_id])
    @move = @character.moves.find(params[:id])
  end

  def edit
    @game = Game.find(params[:game_id])
    @character = Character.find(params[:character_id])
    @move = @character.moves.find(params[:id])
  end

  def update
    @game = Game.find(params[:game_id])
    @character = Character.find(params[:character_id])
    @move = @character.moves.find(params[:id])

    if @move.update(move_params)
      redirect_to game_character_path(@game, @character)
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @character = Character.find(params[:character_id])
    @move = @character.moves.find(params[:id])
    @move.destroy
    redirect_to game_character_path(@game, @character)
  end  

  private
    def move_params
      params.require(:move).permit(:name, :input)
    end
end
