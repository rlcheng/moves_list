require 'elasticsearch/model'

class Game < ActiveRecord::Base
  include Searchable
  has_many :characters, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }
end

# Delete the previous games index in Elasticsearch
Game.__elasticsearch__.client.indices.delete index: Game.index_name rescue nil

# Create the new index with the new mapping
Game.__elasticsearch__.client.indices.create \
  index: Game.index_name,
  body: { settings: Game.settings.to_hash, mappings: Game.mappings.to_hash }

# Index all game records from the DB to Elasticsearch
Game.import
