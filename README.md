##Moves List app Readme

[![Code Climate](https://codeclimate.com/github/rlcheng/moves_list/badges/gpa.svg)](https://codeclimate.com/github/rlcheng/moves_list)
[![Dependency Status](https://gemnasium.com/rlcheng/moves_list.svg)](https://gemnasium.com/rlcheng/moves_list)
[![Coverage Status](https://coveralls.io/repos/github/rlcheng/moves_list/badge.svg?branch=master)](https://coveralls.io/github/rlcheng/moves_list?branch=master)
[![Build Status](https://travis-ci.org/rlcheng/moves_list.svg?branch=master)](https://travis-ci.org/rlcheng/moves_list)

###To install
Make sure you have the correct Ruby version. Check .ruby-version at root of the project or in the gemfile.

```sh
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s
```

###Introduction
I like video games, particularly fighting games, but I have a lot of games and can't seem to remember the moves for them all. I have a lot of old/vintage video game systems that do not have built in moves lists. So I built an app to help me organize moves list for various fighting games.

The layout of the models in the app is simple. There are many games. Each game has many characters. Each character has many moves.

Without logging in one can view a list of all games in the app, each game's characters, and each character's moves. You cannot create, edit, or delete. Any attempt to do any of the 3 will get a redirect and an error message.

Once you log in you can create, edit, or delete.

###To be implemented
- **Front end.** Need to make it pretty.
- **Full delete.** Right now if you delete a game it does not delete any characters associated with the game or those characters' moves. Those data stay in the database and get orphaned. Likewise when you delete a character, their moves stay in the database. These data are not reachable but be best if they are just deleted.
- **Add a search function.** Need to have a search bar that lets you search for games, characters, or moves.
- **Add Games via text file upload.** Manually entering sucks. Using the `seeds.rb` works but I'd much rather have the user have the freedom to do so. So need to be able to let users upload a simple text file and have the app parse and put into the database.
- **Add Games via csv file upload.** Supporting simple text files is great, but it'll be even more awesome if we can support csv files where someone decides to do a spreadsheet for moves.
