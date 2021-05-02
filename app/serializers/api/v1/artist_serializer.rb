class Api::V1::ArtistSerializer < ActiveModel::Serializer
  type :artist

  attributes(
    :id,
    :name,
    :age,
    :self,
    :albums 
  )
  def self
    return object.self_url
  end

  def id
    return object.identifier
  end

  def albums
    url = "http://localhost:3000/"
    return "#{url}artists/#{object.identifier}/albums"
  end
end
