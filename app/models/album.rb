class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks
  before_validation :encode
  validates :identifier, uniqueness: true
  validates :name, :genre, presence: true

  def encode 
    self.identifier = Base64.urlsafe_encode64("#{self.name}:#{self.artist.identifier}")[0..21]
  end

  def self_url
    url = "http://localhost:3000/"
    return "#{url}albums/#{self.identifier}"
  end
end
