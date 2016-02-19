class CharactersController < ApplicationController
  before_action :find_game
  before_action :find_character, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only: [:create, :edit, :update, :destroy]

  def create
    @character = @game.characters.create(character_params)
    redirect_to game_path(@game)
  end

  def show
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @character.destroy
    redirect_to game_path(@game)
  end

  private
    def find_game
      @game = Game.find(params[:game_id])     
    end

    def find_character
      @character = @game.characters.find(params[:id]) 
    end

    def character_params
      params.require(:character).permit(:name)
    end
end
