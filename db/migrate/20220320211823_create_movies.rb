# frozen_string_literal: true

require 'securerandom'

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies, id: :uuid do |t|
      t.string :title, unique: true
      t.string :genre
      t.string :year
      t.string :country
      t.string :published_at
      t.string :description, unique: true

      t.timestamps
    end
  end
end
