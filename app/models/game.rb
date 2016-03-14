class Game < ActiveRecord::Base
  has_many :characters, dependent: :destroy
  validates :title, presence: true, length: { minimum: 2 }
end
