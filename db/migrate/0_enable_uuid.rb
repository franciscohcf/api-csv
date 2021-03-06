# frozen_string_literal: true

class EnableUuid < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto'
    enable_extension 'uuid-ossp'
  end
end
