class Artist < ApplicationRecord
  has_many :albums
  before_validation :encode
  validates :identifier, uniqueness: true
  validates :name, :age, presence: true
  validates :age, numericality: { only_integer: true }

  def encode 
    self.identifier = Base64.urlsafe_encode64(self.name)
  end
end
