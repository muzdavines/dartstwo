class Tournament < ApplicationRecord
  has_many :players, dependent: :destroy
end
