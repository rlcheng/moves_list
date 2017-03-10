class AddTypeToMoves < ActiveRecord::Migration[5.0]
  def change
    add_column :moves, :category, :string
  end
end
