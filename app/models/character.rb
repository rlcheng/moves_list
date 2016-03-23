class Character < ActiveRecord::Base
  include Searchable
  belongs_to :game
  has_many :moves, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
end

# Delete the previous characters index in Elasticsearch
Character.__elasticsearch__.client.indices.delete index: Character.index_name rescue nil

# Create the new index with the new mapping
Character.__elasticsearch__.client.indices.create \
  index: Character.index_name,
  body: { settings: Character.settings.to_hash, mappings: Character.mappings.to_hash }

# Index all character records from the DB to Elasticsearch
Character.import
