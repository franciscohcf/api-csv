# frozen_string_literal: true

module Api
  module V1
    class MoviesController < Api::V1::ApiController
      def index
        movies = Movie.all.order('year DESC')
        movies = movies.where(year: params[:year]) if params[:year]
        movies = movies.where(genre: params[:genre]) if params[:genre]
        movies = movies.where(country: params[:country]) if params[:country]
        render json: movies.as_json(except: %i[created_at updated_at]), status: :ok
      end
    end
  end
end
