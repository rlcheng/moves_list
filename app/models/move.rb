class Move < ActiveRecord::Base
  belongs_to :character
  validates :name, :input, presence: true, length: { minimum: 2 }
end
