# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :title, :description, uniqueness: true
end
