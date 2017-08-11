class Player < ApplicationRecord
  has_many :darters, dependent: :destroy
  belongs_to :tournament
end
