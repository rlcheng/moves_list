class MovesController < ApplicationController
  before_action :find_character, only: [:new, :create, :index]
  before_action :find_move, only: [:edit, :update, :destroy]
  before_action :authorize, only: [:create, :edit, :update, :destroy]

  def new
    @move = @character.moves.build
  end

  def create
    @move = @character.moves.build(move_params)
    if @move.save
      redirect_to character_moves_path(@character)
    else
      render 'new'
    end
  end

  def index
    @moves = @character.moves.order(:name).group_by(&:category)
  end

  def edit
  end

  def update
    if @move.update(move_params)
      redirect_to character_moves_path(@move.character_id)
    else
      render 'edit'
    end
  end

  def destroy
    @move.destroy
    redirect_to character_moves_path(@move.character_id)
  end  

  private
    def find_character
      @character = Character.find(params[:character_id])
    end

    def find_move
      @move = Move.find(params[:id])
    end

    def move_params
      params.require(:move).permit(:category, :name, :input)
    end
end
