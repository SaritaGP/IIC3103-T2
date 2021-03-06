class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums
  before_validation :encode
  validates :identifier, uniqueness: true
  validates :name, :age, presence: true
  validates :age, numericality: { only_integer: true }

  def encode 
    self.identifier = Base64.urlsafe_encode64(self.name)[0..21]
  end

  def self_url
    url = "http://localhost:3000/"
    if Rails.env.production?
      url = "https://iic3103-tarea2-sg.herokuapp.com/"
    end
    return "#{url}artists/#{self.identifier}"
  end
end
