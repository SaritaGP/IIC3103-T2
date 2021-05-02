class Track < ApplicationRecord
  belongs_to :album
  before_validation :default_time
  before_validation :encode
  validates :identifier, uniqueness: true
  validates :name, :duration, presence: true
  validates :duration, numericality: true 

  def encode 
    self.identifier = Base64.urlsafe_encode64("#{self.name}:#{self.album.identifier}")[0..21]
  end

  def self_url
    url = "http://localhost:3000/"
    return "#{url}tracks/#{self.identifier}"
  end

  def default_time
    self.times_played ||= 0 
  end
  
end
