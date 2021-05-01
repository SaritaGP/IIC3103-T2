require 'swagger_helper'

describe 'API V1 Artists', swagger_doc: 'v1/swagger.json' do
  path '/artists' do
    get 'Retrieves Artists' do
      description 'Retrieves all the artists'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:artist, collection_count) }

      response '200', 'Artists retrieved' do
        schema('$ref' => '#/definitions/artists_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Artist' do
      description 'Creates Artist'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :artist, in: :body)

      response '201', 'artist created' do
        let(:artist) do
          {
            identifier: 'Some identifier',
            name: 'Some name',
            age: 666
          }
        end

        run_test!
      end
    end
  end

  path '/artists/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_artist) { create(:artist) }
    let(:id) { existent_artist.id }

    get 'Retrieves Artist' do
      produces 'application/json'

      response '200', 'artist retrieved' do
        schema('$ref' => '#/definitions/artist_resource')

        run_test!
      end

      response '404', 'invalid artist id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Artist' do
      description 'Updates Artist'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :artist, in: :body)

      response '200', 'artist updated' do
        let(:artist) do
          {
            identifier: 'Some identifier',
            name: 'Some name',
            age: 666
          }
        end

        run_test!
      end
    end

    delete 'Deletes Artist' do
      produces 'application/json'
      description 'Deletes specific artist'

      response '204', 'artist deleted' do
        run_test!
      end

      response '404', 'artist not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
