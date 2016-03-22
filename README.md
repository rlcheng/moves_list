##Moves List app Readme

[![Code Climate](https://codeclimate.com/github/rlcheng/moves_list/badges/gpa.svg)](https://codeclimate.com/github/rlcheng/moves_list)
[![Dependency Status](https://gemnasium.com/rlcheng/moves_list.svg)](https://gemnasium.com/rlcheng/moves_list)
[![Coverage Status](https://coveralls.io/repos/github/rlcheng/moves_list/badge.svg?branch=master)](https://coveralls.io/github/rlcheng/moves_list?branch=master)
[![Build Status](https://travis-ci.org/rlcheng/moves_list.svg?branch=master)](https://travis-ci.org/rlcheng/moves_list)

###About
I like video games, particularly fighting games, but I have a lot of games and can't seem to remember the moves for them all. I have a lot of old/vintage video game systems that do not have built in moves lists. So I built an app to help me organize moves list for various fighting games.

The layout of the models in the app is simple. There are many games. Each game has many characters. Each character has many moves.

Without logging in one can view a list of all games in the app, each game's characters, and each character's moves. You cannot create, edit, or delete. Any attempt to do any of the 3 will get a redirect and an error message.

Once you log in you can create, edit, or delete.

App is searchable too. Right now it's limited to only searching Game titles.

###To install
Make sure you have ElasticSearch installed. If you are on a Mac, use Homebrew: 
```sh
$ brew install elasticsearch
```

Note: If you do not have Homebrew, installing Homebrew can break your existing Ruby install (it broke openssl for me) so reinstall Ruby after you install homebrew (use something like RVM to keep it simple). Also, if you do not have Java installed when installing ElasticSearch via Homebrew, just follow the onscreen instructions to install Java and then install ElasticSearch.

After ElasticSearch is installed follow instructions to start it.

To have launchd start ElasticSearch at login:
```sh
$ ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents
```
Load ElasticSearch now:
```sh
$ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist
```

Verify ElasticSearch install by going to ```localhost:9200``` You will see ElasticSearch version number and other stats.

Make sure you have the correct Ruby version. Check .ruby-version at root of the project or in the gemfile.

```sh
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s
```
