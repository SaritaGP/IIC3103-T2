ARTIST_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'artist' },
    attributes: {
      type: :object,
      properties: {
        identifier: { type: :string, example: 'Some identifier', 'x-nullable': true },
        name: { type: :string, example: 'Some name', 'x-nullable': true },
        age: { type: :integer, example: 666, 'x-nullable': true },
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

ARTISTS_COLLECTION_SCHEMA = {
  type: 'object',
  properties: {
    data: {
      type: 'array',
      items: { '$ref' => '#/definitions/artist' }
    }
  },
  required: [
    :data
  ]
}

ARTIST_RESOURCE_SCHEMA = {
  type: 'object',
  properties: {
    data: { '$ref' => '#/definitions/artist' }
  },
  required: [
    :data
  ]
}
