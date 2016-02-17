class Game < ActiveRecord::Base
  has_many :characters
  validates :title, presence: true, length: { minimum: 2 }
end
