# frozen_string_literal: true

class AddTypeToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :media, :string, default: 'podcast'
  end
end
