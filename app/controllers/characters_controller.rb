class CharactersController < ApplicationController
  before_action :find_game, only: [:new, :create, :index]
  before_action :find_character, only: [:edit, :update, :destroy]
  before_action :authorize, only: [:create, :edit, :update, :destroy]

  def new
    @character = @game.characters.build
  end

  def create
    @character = @game.characters.build(character_params)
    if @character.save
      redirect_to game_characters_path(@game)
    else
      render 'new'
    end
  end

  def index
    @characters = @game.characters
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to game_characters_path(@character.game_id)
    else
      render 'edit'
    end
  end

  def destroy
    @character.destroy
    redirect_to game_characters_path(@character.game_id)
  end

  private
    def find_game
      @game = Game.find(params[:game_id])
    end

    def find_character
      @character = Character.find(params[:id]) 
    end

    def character_params
      params.require(:character).permit(:name)
    end
end
