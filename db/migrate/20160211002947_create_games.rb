class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
