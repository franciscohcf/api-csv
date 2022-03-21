# frozen_string_literal: true

require 'csv'

module Api
  module V1
    class SeedMoviesController < Api::V1::ApiController
      def csv_db
        csv_text = File.read(params[:file].tempfile.path)
        csv = CSV.parse(csv_text, headers: true)

        csv.each do |row|
          str = row['date_added']
          Movie.create(title: row['title'], genre: row['type'], year: row['release_year'], country: row['country'],
                       published_at: Date.parse(str), description: row['description'])
        end
        render json: { sucesso: 'CSV recebido!' }
      end
    end
  end
end
