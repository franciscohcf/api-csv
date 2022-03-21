# frozen_string_literal: true

require 'rails_helper'

describe 'Movie API' do
  context 'GET /api/v1/movies' do
    it 'com sucesso' do
      Movie.create!(title: '13 Reasons Why',
                    genre: 'TV Show',
                    year: '2020',
                    country: 'United States',
                    published_at: '2020-06-05',
                    description: "After a teenage girl's perplexing suicide, a classmate receives a series of tapes.")

      Movie.create!(title: 'The Worst Witch',
                    genre: 'TV Show',
                    year: '2020',
                    country: 'United Kingdom, Germany',
                    published_at: '2020-10-01',
                    description: 'After stumbling into a school for witches.')

      get '/api/v1/movies'

      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response[0]['title']).to eq '13 Reasons Why'
      expect(parsed_response[1]['title']).to eq 'The Worst Witch'
      expect(response.body).to include "After a teenage girl's perplexing suicide,
                                         a classmate receives a series of tapes."
      expect(response.body).to include 'After stumbling into a school for witches.'
    end

    it 'response vazia' do
      get '/api/v1/movies'

      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response).to eq []
    end

    it 'filtra por ano de lançamento' do
      Movie.create!(title: '13 Reasons Why',
                    genre: 'TV Show',
                    year: '2020',
                    country: 'United States',
                    published_at: '2020-06-05',
                    description: "After a teenage girl's perplexing suicide, a classmate receives a series of tapes.")

      Movie.create!(title: 'The Worst Witch',
                    genre: 'TV Show',
                    year: '2020',
                    country: 'United Kingdom, Germany',
                    published_at: '2020-10-01',
                    description: 'After stumbling into a school for witches.')

      Movie.create!(id: 'df9e7d62-5037-4036-8413-53b09ef74269',
                    title: '21 Sarfarosh: Saragarhi 1897',
                    genre: 'TV Show',
                    year: '2018',
                    country: 'India',
                    published_at: '2018-12-01',
                    description: "In one of history's greatest last stands, a battalion of 21 Sikh soldiers fights.")

      Movie.create!(id: '7b421f7e-79ce-4bc9-97a0-24be55c78c60',
                    title: '5Gang',
                    genre: 'Movie',
                    year: '2019',
                    country: 'Romania',
                    published_at: '2020-04-27',
                    description: 'To keep the band together, Selly tries to earn money by making an appearance.')

      get '/api/v1/movies?year[]=2020'

      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response[0]['title']).to eq '13 Reasons Why'
      expect(parsed_response[1]['title']).to eq 'The Worst Witch'
      expect(response.body).not_to include '21 Sarfarosh: Saragarhi 1897'
      expect(response.body).not_to include '5Gang'
    end

    it 'filtra por série/filme' do
      Movie.create!(title: '13 Reasons Why',
                    genre: 'TV Show',
                    year: '2020',
                    country: 'United States',
                    published_at: '2020-06-05',
                    description: "After a teenage girl's perplexing suicide, a classmate receives a series of tapes.")

      Movie.create!(title: 'The Worst Witch',
                    genre: 'TV Show',
                    year: '2020',
                    country: 'United Kingdom, Germany',
                    published_at: '2020-10-01',
                    description: 'After stumbling into a school for witches.')

      Movie.create!(id: 'df9e7d62-5037-4036-8413-53b09ef74269',
                    title: '21 Sarfarosh: Saragarhi 1897',
                    genre: 'TV Show',
                    year: '2018',
                    country: 'India',
                    published_at: '2018-12-01',
                    description: "In one of history's greatest last stands, a battalion of 21 Sikh soldiers fights.")

      Movie.create!(id: '7b421f7e-79ce-4bc9-97a0-24be55c78c60',
                    title: '5Gang',
                    genre: 'Movie',
                    year: '2019',
                    country: 'Romania',
                    published_at: '2020-04-27',
                    description: 'To keep the band together, Selly tries to earn money by making an appearance.')

      get '/api/v1/movies?genre[]=TV Show'

      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response[0]['title']).to eq '13 Reasons Why'
      expect(parsed_response[1]['title']).to eq 'The Worst Witch'
      expect(parsed_response[2]['title']).to eq '21 Sarfarosh: Saragarhi 1897'
      expect(response.body).not_to include '5Gang'
    end

    it 'filtra por país' do
      Movie.create!(title: '13 Reasons Why',
                    genre: 'TV Show',
                    year: '2020',
                    country: 'United States',
                    published_at: '2020-06-05',
                    description: "After a teenage girl's perplexing suicide, a classmate receives a series of tapes.")

      Movie.create!(title: 'The Worst Witch',
                    genre: 'TV Show',
                    year: '2020',
                    country: 'United Kingdom, Germany',
                    published_at: '2020-10-01',
                    description: 'After stumbling into a school for witches.')

      Movie.create!(id: 'df9e7d62-5037-4036-8413-53b09ef74269',
                    title: '21 Sarfarosh: Saragarhi 1897',
                    genre: 'TV Show',
                    year: '2018',
                    country: 'India',
                    published_at: '2018-12-01',
                    description: "In one of history's greatest last stands, a battalion of 21 Sikh soldiers fights.")

      Movie.create!(id: '7b421f7e-79ce-4bc9-97a0-24be55c78c60',
                    title: '5Gang',
                    genre: 'Movie',
                    year: '2019',
                    country: 'Romania',
                    published_at: '2020-04-27',
                    description: 'To keep the band together, Selly tries to earn money by making an appearance.')

      get '/api/v1/movies?country[]=Romania'

      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to include('application/json')
      expect(parsed_response[0]['title']).to eq '5Gang'
      expect(response.body).not_to include '13 Reasons Why'
      expect(response.body).not_to include 'The Worst Witch'
      expect(response.body).not_to include '21 Sarfarosh: Saragarhi 1897'
    end
  end
end
