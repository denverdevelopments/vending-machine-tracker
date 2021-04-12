class Machine < ApplicationRecord
  validates_presence_of :location
  belongs_to :owner

  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def average_price
    self.snacks.average(:price)
  end

  def count_jakes_face
    self.snacks.count 
  end
end
