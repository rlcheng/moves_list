class Character < ActiveRecord::Base
  belongs_to :game
  has_many :moves
  validates :name, presence: true, length: { minimum: 2 }
end
