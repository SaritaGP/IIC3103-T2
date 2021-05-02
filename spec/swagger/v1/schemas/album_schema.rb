ALBUM_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'album' },
    attributes: {
      type: :object,
      properties: {
        identifier: { type: :string, example: 'Some identifier', 'x-nullable': true },
        name: { type: :string, example: 'Some name', 'x-nullable': true },
        genre: { type: :string, example: 'Some genre', 'x-nullable': true },
        artist_id: { type: :integer, example: 666, 'x-nullable': true },
        created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
        updated_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true }
      },
      required: []
    }
  },
  required: %i[
    id
    type
    attributes
  ]
}

ALBUMS_COLLECTION_SCHEMA = {
  type: 'object',
  properties: {
    data: {
      type: 'array',
      items: { '$ref' => '#/definitions/album' }
    }
  },
  required: [
    :data
  ]
}

ALBUM_RESOURCE_SCHEMA = {
  type: 'object',
  properties: {
    data: { '$ref' => '#/definitions/album' }
  },
  required: [
    :data
  ]
}
