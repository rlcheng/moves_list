class AddTypeToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :category, :string
  end
end
