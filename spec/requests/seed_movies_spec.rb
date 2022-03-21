# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::SeedMoviesController, type: :request do
  fixtures :all
  before do
    @file = fixture_file_upload('tmp/netflix_titles.csv', 'csv')
  end
  context 'POST /api/v1/seed_movies' do
    before do
      headers = { 'CONTENT_TYPE' => 'text/csv' }

      body = {
        file: @file
      }

      post '/api/v1/seed_movies', params: body, headers: headers
    end

    it 'com sucesso' do
      expect(response).to have_http_status(200)
      expect(response.body).to include 'CSV recebido!'
      expect(Movie.all.count).to eq 131
    end
  end
end
