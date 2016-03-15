#Game
game = Game.create!(title: "Samurai Shodown 2")
#Character
character = game.characters.create!(name: "Genjuro")
#Moves
character.moves.create!(category: "Special", name: "Toha Kouyokujin",
                        input: "FDDF+Slash")
character.moves.create!(category: "Special", name: "Sanrensatsu",
                        input: "QCF+Slash *can be repeated up to 3x")
character.moves.create!(category: "Special", name: "Oukazan",
                        input: "QCB+Slash")
character.moves.create!(category: "Special", name: "Super Deformed",
                        input: "HCBFB+B")
character.moves.create!(category: "Power Special", name: "Gokouzan",
                        input: "HCBF+A")
#Another Character and moves
character = game.characters.create!(name: "Haohmaru")
character.moves.create!(category: "Special", name: "Kogetsuzan",
                        input: "FBDDDF+Slash")
character.moves.create!(category: "Special", name: "Resshin Zan",
                        input: "FDDF+Kick")
character.moves.create!(category: "Special", name: "Senpuretsuzan",
                        input: "QCF+Slash")
character.moves.create!(category: "Special", name: "False Senpuretsuzan",
                        input: "QCF+Kick")
character.moves.create!(category: "Special", name: "Sake Kogeki",
                        input: "QCB+A")
character.moves.create!(category: "Special", name: "Kogetsuzen Combo",
                        input: "DFHCBBDDF+BC")
character.moves.create!(category: "Special", name: "Super Deformed",
                        input: "HCBFB+B")
character.moves.create!(category: "Power Special", name: "Tempa Seikouzan",
                        input: "FDFDBDBF+A")
