class Api::V1::ArtistSerializer < ActiveModel::Serializer
  type :artist

  attributes(
    :id,
    :name,
    :age,
    :self 
  )
  def self
    url = "http://localhost:3000/"
    return "#{url}artists/#{object.identifier}"
  end

  def id
    return "#{object.identifier}"
  end
end
