class Character < ActiveRecord::Base
  belongs_to :game
  has_many :moves, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
end
