require 'swagger_helper'

describe 'API V1 Albums', swagger_doc: 'v1/swagger.json' do
  path '/albums' do
    get 'Retrieves Albums' do
      description 'Retrieves all the albums'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:album, collection_count) }

      response '200', 'Albums retrieved' do
        schema('$ref' => '#/definitions/albums_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Album' do
      description 'Creates Album'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :album, in: :body)

      response '201', 'album created' do
        let(:album) do
          {
            identifier: 'Some identifier',
            name: 'Some name',
            genre: 'Some genre',
            artist_id: 666
          }
        end

        run_test!
      end
    end
  end

  path '/albums/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_album) { create(:album) }
    let(:id) { existent_album.id }

    get 'Retrieves Album' do
      produces 'application/json'

      response '200', 'album retrieved' do
        schema('$ref' => '#/definitions/album_resource')

        run_test!
      end

      response '404', 'invalid album id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Album' do
      description 'Updates Album'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :album, in: :body)

      response '200', 'album updated' do
        let(:album) do
          {
            identifier: 'Some identifier',
            name: 'Some name',
            genre: 'Some genre',
            artist_id: 666
          }
        end

        run_test!
      end
    end

    delete 'Deletes Album' do
      produces 'application/json'
      description 'Deletes specific album'

      response '204', 'album deleted' do
        run_test!
      end

      response '404', 'album not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
