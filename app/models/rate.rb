class Rate < ApplicationRecord
  point = [1, 2, 3, 4, 5]

  validates :point, numericality: { only_integer: true }, :inclusion=> { :in => point }

  belongs_to :user, optional: true
end
