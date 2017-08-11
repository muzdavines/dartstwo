class Darter < ApplicationRecord
  has_many :rounds, dependent: :destroy
  belongs_to :player
end
