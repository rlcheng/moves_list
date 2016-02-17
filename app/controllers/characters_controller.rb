class CharactersController < ApplicationController
before_action :authorize, only: [:new, :edit, :update, :destroy]  

  def edit
    @game = Game.find(params[:game_id])
    @character = @game.characters.find(params[:id])
  end

  def create
    @game = Game.find(params[:game_id])
    @character = @game.characters.create(character_params)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:game_id])
    @character = @game.characters.find(params[:id])
  end

  def update
    @game = Game.find(params[:game_id])
    @character = @game.characters.find(params[:id])

    if @character.update(character_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @character = @game.characters.find(params[:id])
    @character.destroy
    redirect_to game_path(@game)
  end

  private
    def character_params
      params.require(:character).permit(:name)
    end
end
