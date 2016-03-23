class Move < ActiveRecord::Base
  include Searchable
  belongs_to :character
  validates :name, :input, :category, presence: true, length: { minimum: 2 }
end

# Delete the previous moves index in Elasticsearch
Move.__elasticsearch__.client.indices.delete index: Move.index_name rescue nil

# Create the new index with the new mapping
Move.__elasticsearch__.client.indices.create \
  index: Move.index_name,
  body: { settings: Move.settings.to_hash, mappings: Move.mappings.to_hash }

# Index all move records from the DB to Elasticsearch
Move.import
