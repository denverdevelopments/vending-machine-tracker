class Snack < ApplicationRecord
  validates_presence_of :label
  validates_presence_of :price
  validates_numericality_of :price

  has_many :machine_snacks
  has_many :machines, through: :machine_snacks
end
