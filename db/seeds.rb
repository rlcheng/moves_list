#Game
game = Game.create!(title: "Samurai Shodown 2")
#Character
character = game.characters.create!(name: "Genjuro")
#Moves
character.moves.create!(name: "Toha Kouyokujin", input: "FDDF+Slash")
character.moves.create!(name: "Sanrensatsu", input: "QCF+Slash *can be repeated up to 3x")
character.moves.create!(name: "Oukazan", input: "QCB+Slash")
character.moves.create!(name: "Super Deformed", input: "HCBFB+B")
character.moves.create!(name: "Power Special - Gokouzan", input: "HCBF+A")
