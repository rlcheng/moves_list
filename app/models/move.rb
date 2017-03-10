class Move < ApplicationRecord
  belongs_to :character
  validates :name, :input, :category, presence: true, length: { minimum: 2 }
end
